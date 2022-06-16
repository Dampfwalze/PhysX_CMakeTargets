import sys
import os.path
import xml.etree.ElementTree


def main():
    if len(sys.argv) != 2:
        exit(-1)
    
    presetName = sys.argv[1]
    if(os.path.isfile(presetName)):
        xmlPath = presetName
    else:
        xmlPath = "physx/buildtools/presets/"+presetName+'.xml'
        if not os.path.isfile(xmlPath):
            xmlPath = "physx/buildtools/presets/public/"+presetName+'.xml'
            if not os.path.isfile(xmlPath):
                print('Preset xml file: '+xmlPath+' not found')
                exit(-1)
    
    presetNode = xml.etree.ElementTree.parse(xmlPath).getroot()

    for platform in presetNode.findall('platform'):
        targetPlatform = platform.attrib['targetPlatform']
    
    print(presetNode.attrib['name'], end=";")
    print(targetPlatform, end="")

main()