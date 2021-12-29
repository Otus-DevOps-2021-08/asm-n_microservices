#!/usr/bin/python3

import os
import json
import subprocess


TERRAFORM_STATE_DIR = "../terraform/"


def ReadTerraformState(terraformDir: str) -> dict:
  oldCwd = os.getcwd()
  terraformState = dict()
  try:
    os.chdir(terraformDir)
    terraformStateJson = subprocess.run(["terraform", "show", "-json"],
                                        stdout=subprocess.PIPE,
                                        stderr=subprocess.PIPE).stdout
    terraformState = json.loads(terraformStateJson)
  except:
    pass
  finally:
    os.chdir(oldCwd)
  return terraformState


def CreateInventory() -> dict:
  inventory = dict()
  inventory["_meta"] = dict()
  inventory["_meta"]["hostvars"] = dict()
  return inventory


def CreateInventoryGroup() -> dict:
  inventoryGroup = dict()
  inventoryGroup["hosts"] = list()
  inventoryGroup["vars"] = dict()
  return inventoryGroup


def AddHostToInventory(inventory: dict, hostname: str, ipAddr: str, groups: list):
  if hostname not in inventory["_meta"]["hostvars"]:
    inventory["_meta"]["hostvars"][hostname] = dict()
  inventory["_meta"]["hostvars"][hostname]["ansible_host"] = ipAddr

  for group in groups:
    if group not in inventory:
      inventory[group] = CreateInventoryGroup()
    inventory[group]["hosts"].append(hostname)


def main():
  terraformState = ReadTerraformState(TERRAFORM_STATE_DIR)
  #print(json.dumps(terraformState, indent=2))

  inventory = CreateInventory()

  if "values" in terraformState:
    for resource in terraformState["values"]["root_module"]["resources"]:
      if resource["type"] != "yandex_compute_instance":
        continue
      AddHostToInventory(
        inventory,
        resource["values"]["name"],
        resource["values"]["network_interface"][0]["nat_ip_address"],
        [group.strip() for group in resource["values"]["metadata"]["ansible_groups"].split(',')]
      )
    for childModule in terraformState["values"]["root_module"]["child_modules"]:
      for resource in childModule["resources"]:
        if resource["type"] != "yandex_compute_instance":
          continue
        AddHostToInventory(
          inventory,
          resource["values"]["name"],
          resource["values"]["network_interface"][0]["nat_ip_address"],
          [group.strip() for group in resource["values"]["metadata"]["ansible_groups"].split(',')]
        )

  print(json.dumps(inventory))


if __name__ == "__main__":
  main()
