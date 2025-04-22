#
# SPDX-FileCopyrightText: 2009 The Android Open Source Project
# SPDX-FileCopyrightText: 2011 The Linux Foundation
# SPDX-FileCopyrightText: 2017-2018 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

import hashlib
import common
import re

def FullOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def IncrementalOTA_InstallEnd(info):
  OTA_InstallEnd(info)
  return

def AddImage(info, basename, dest):
  path = "IMAGES/" + basename
  if path not in info.input_zip.namelist():
    return

  data = info.input_zip.read(path)
  common.ZipWriteStr(info.output_zip, basename, data)
  info.script.Print("Patching {} image unconditionally...".format(dest.split('/')[-1]))
  info.script.AppendExtra('package_extract_file("%s", "%s");' % (basename, dest))

def AddImageRadio(info, basename, dest):
  name = basename
  if ("RADIO/" + basename) in info.input_zip.namelist():
    data = info.input_zip.read("RADIO/" + basename)
    common.ZipWriteStr(info.output_zip, name, data)
    info.script.Print("Patching {} image unconditionally...".format(dest.split('/')[-1]))
    info.script.AppendExtra('package_extract_file("%s", "%s");' % (name, dest))

def OTA_InstallEnd(info):
  AddImage(info, "dtbo.img", "/dev/block/bootdevice/by-name/dtbo")
  AddImage(info, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta")
  AddImageRadio(info, "aboot.mbn", "/dev/block/bootdevice/by-name/aboot")
  AddImageRadio(info, "cmnlib.mbn", "/dev/block/bootdevice/by-name/cmnlib")
  AddImageRadio(info, "cmnlib64.mbn", "/dev/block/bootdevice/by-name/cmnlib64")
  AddImageRadio(info, "devcfg.mbn", "/dev/block/bootdevice/by-name/devcfg")
  AddImageRadio(info, "dsp.bin", "/dev/block/bootdevice/by-name/dsp")
  AddImageRadio(info, "keymaster.mbn", "/dev/block/bootdevice/by-name/keymaster")
  AddImageRadio(info, "lksecapp.mbn", "/dev/block/bootdevice/by-name/lksecapp")
  AddImageRadio(info, "mdtp.mbn", "/dev/block/bootdevice/by-name/mdtp")
  AddImageRadio(info, "modem.bin", "/dev/block/bootdevice/by-name/modem")
  AddImageRadio(info, "rpm.mbn", "/dev/block/bootdevice/by-name/rpm")
  AddImageRadio(info, "sbl1.mbn", "/dev/block/bootdevice/by-name/sbl1")
  AddImageRadio(info, "splash.img", "/dev/block/bootdevice/by-name/splash")
  AddImageRadio(info, "tz.mbn", "/dev/block/bootdevice/by-name/tz")
  return
