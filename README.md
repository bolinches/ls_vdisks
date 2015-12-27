# ls_vdisks
Gives information about NPIV and vSCSI mappings from AIX LPAR. It does not need network connection to the VIO or HMC. It runs locally on the AIX LPAR.

On NPIV in prints the WWPN the VIO and the vFC device. 

The following is an example output of a LPAR that has NPIV and vSCSI devices. 

This script works only with AIX 6.1/7.1. For older systems will not provide all the information


NPIV Information:

    Hardware Location                    WWPN          FC DEV       VIO
NPIV device  
U9117.MMB.65218FA-V20-C30-T1  -->  C0507603FC320004  --> fcs0 -->
shp01_vio3vfchost0
                                    |
                                    --------->   disks on fcs0 ->
                                                  SAN SERIAL      LUN
                                                  hdisk6       -> 600507680192820AC80000000000118A
                                                  hdisk7       -> 600507680192820AC80000000000118B
                                                  hdisk8       -> 600507680192820AC80000000000118C
                                                  hdisk9       -> 600507680192820AC80000000000118D
                                                  hdisk10       -> 600507680192820AC80000000000118E
                                                  hdisk11       -> 600507680196020C50000000000008C9
                                                  hdisk12       -> 600507680196020C50000000000008CA
                                                  hdisk13       -> 600507680196020C50000000000008CB
                                                  hdisk14       -> 600507680196020C50000000000008CC
                                                  hdisk15       -> 600507680196020C50000000000008CD


    Hardware Location                    WWPN          FC DEV       VIO
NPIV device  
U9117.MMB.65218FA-V20-C31-T1  -->  C0507603FC320006  --> fcs1 -->
shp01_vio4vfchost0
                                    |
                                    --------->   disks on fcs1 ->
                                                  SAN SERIAL      LUN
                                                  hdisk6       -> 600507680192820AC80000000000118A
                                                  hdisk7       -> 600507680192820AC80000000000118B
                                                  hdisk8       -> 600507680192820AC80000000000118C
                                                  hdisk9       -> 600507680192820AC80000000000118D
                                                  hdisk10       -> 600507680192820AC80000000000118E
                                                  hdisk11       -> 600507680196020C50000000000008C9
                                                  hdisk12       -> 600507680196020C50000000000008CA
                                                  hdisk13       -> 600507680196020C50000000000008CB
                                                  hdisk14       -> 600507680196020C50000000000008CC
                                                  hdisk15       -> 600507680196020C50000000000008CD


    Hardware Location                    WWPN          FC DEV       VIO
NPIV device  
U9117.MMB.65218FA-V20-C40-T1  -->  C0507603FC320000  --> fcs2 -->
shp01_vio3vfchost2
                                    |
                                    --------->   disks on fcs2 ->
                                                  SAN SERIAL      LUN
                                                  hdisk6       -> 600507680192820AC80000000000118A
                                                  hdisk7       -> 600507680192820AC80000000000118B
                                                  hdisk8       -> 600507680192820AC80000000000118C
                                                  hdisk9       -> 600507680192820AC80000000000118D
                                                  hdisk10       -> 600507680192820AC80000000000118E
                                                  hdisk11       -> 600507680196020C50000000000008C9
                                                  hdisk12       -> 600507680196020C50000000000008CA
                                                  hdisk13       -> 600507680196020C50000000000008CB
                                                  hdisk14       -> 600507680196020C50000000000008CC
                                                  hdisk15       -> 600507680196020C50000000000008CD


    Hardware Location                    WWPN          FC DEV       VIO
NPIV device  
U9117.MMB.65218FA-V20-C41-T1  -->  C0507603FC320002  --> fcs3 -->
shp01_vio4vfchost2
                                    |
                                    --------->   disks on fcs3 ->
                                                  SAN SERIAL      LUN
                                                  hdisk6       -> 600507680192820AC80000000000118A
                                                  hdisk7       -> 600507680192820AC80000000000118B
                                                  hdisk8       -> 600507680192820AC80000000000118C
                                                  hdisk9       -> 600507680192820AC80000000000118D
                                                  hdisk10       -> 600507680192820AC80000000000118E
                                                  hdisk11       -> 600507680196020C50000000000008C9
                                                  hdisk12       -> 600507680196020C50000000000008CA
                                                  hdisk13       -> 600507680196020C50000000000008CB
                                                  hdisk14       -> 600507680196020C50000000000008CC
                                                  hdisk15       -> 600507680196020C50000000000008CD




vSCSI Information:

    Hardware Location              vSCSI             VIO      vhost
device                                            SERIAL
U9117.MMB.65218FA-V20-C10-T1  ->  vscsi0   ->    shp01_vio3->vhost4
                                   |
                                   --------->   disks on vscsi0
                                                hdisk0 U9117.MMB.65218FA-V20-C10-T1-L8100000000000000600507680192820AC8000000000010B5
                                                hdisk2 U9117.MMB.65218FA-V20-C10-T1-L8300000000000000600507680192820AC8000000000010BB
                                                hdisk3 U9117.MMB.65218FA-V20-C10-T1-L8400000000000000600507680192820AC8000000000010BC
                                                hdisk4 U9117.MMB.65218FA-V20-C10-T1-L8500000000000000600507680192820AC8000000000010BD
                                                hdisk5 U9117.MMB.65218FA-V20-C10-T1-L8600000000000000600507680192820AC8000000000010BE


    Hardware Location              vSCSI             VIO      vhost
device                                            SERIAL
U9117.MMB.65218FA-V20-C11-T1  ->  vscsi1   ->    shp01_vio4->vhost4
                                   |
                                   --------->   disks on vscsi1
                                                hdisk0 U9117.MMB.65218FA-V20-C10-T1-L8100000000000000600507680192820AC8000000000010B5
                                                hdisk2 U9117.MMB.65218FA-V20-C10-T1-L8300000000000000600507680192820AC8000000000010BB
                                                hdisk3 U9117.MMB.65218FA-V20-C10-T1-L8400000000000000600507680192820AC8000000000010BC
                                                hdisk4 U9117.MMB.65218FA-V20-C10-T1-L8500000000000000600507680192820AC8000000000010BD
                                                hdisk5 U9117.MMB.65218FA-V20-C10-T1-L8600000000000000600507680192820AC8000000000010BE


    Hardware Location              vSCSI             VIO      vhost
device                                            SERIAL
U9117.MMB.65218FA-V20-C20-T1  ->  vscsi2   ->    shp01_vio3->vhost5
                                   |
                                   --------->   disks on vscsi2
                                                hdisk1 U9117.MMB.65218FA-V20-C20-T1-L8100000000000000600507680196020C500000000000086E


    Hardware Location              vSCSI             VIO      vhost
device                                            SERIAL
U9117.MMB.65218FA-V20-C21-T1  ->  vscsi3   ->    shp01_vio4->vhost5
                                   |
                                   --------->   disks on vscsi3
                                                hdisk1 U9117.MMB.65218FA-V20-C20-T1-L8100000000000000600507680196020C500000000000086E

Done!
