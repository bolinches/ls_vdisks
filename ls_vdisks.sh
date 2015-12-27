#!/usr/bin/ksh
#set -x

echo
echo "This script works fine with AIX 6.1/7.1. For older systems will not provide all the information"
echo
sleep 5

set -A FCDEV `lsdev | grep fcs | grep Available | awk '{print$1'} | awk 'BEGIN {ORS="\t"} {print}'`
set -A VIOFC `echo vfcs | kdb | grep fcs | grep -v vfcs | awk '{print$4}' | awk 'BEGIN {ORS="\t"} {print}'`
integer FCMAX=`lsdev | grep fcs | grep "Virtual Fibre Channel" | grep Available | awk {'print$1'} | wc -l`

if [[ $FCMAX -eq 0 ]]; then
        echo
        echo "NPIV: There are not any NPIV devices in this system!"
        echo
        else
        integer i=0
        echo
        echo "NPIV Information:"
        echo
        while  [[ $i -lt $FCMAX ]]
                do HWLOC[$i]=`lscfg -vps -l ${FCDEV[$i]} | grep "Hardware Location Code" | awk '{sub("        Hardware Location Code......", ""); print}'`
                WWPN[$i]=`lscfg -vps -l ${FCDEV[$i]} | grep "Network Address" | awk '{sub("        Network Address.............", ""); print}'`
        echo "    Hardware Location                    WWPN          FC DEV       VIO NPIV device  "
                echo "${HWLOC[$i]}  -->  ${WWPN[$i]}  --> ${FCDEV[$i]} -->  ${VIOFC[$i]}"
                echo "                                    |"
                echo "                                    ---------> disks on ${FCDEV[$i]} ->       SAN SERIAL LUN"
                for hdisk in `lspath | grep fscsi$i | awk 'seen[$0]++ == 1' | awk {'print$2'}`; do echo " "$hdisk "      -> "`odmget -q "name=$hdisk and attribute=unique_id" CuAt |grep value | awk {'print substr($3,7,32)'}`; done;
                echo
                echo
                (( i = i + 1 ))
                done
fi


set -A VSCSIDEV `lsdev | grep vscsi | grep Available | awk '{print$1'} |
awk 'BEGIN {ORS="\t"} {print}'`
set -A VIOVSCSI `echo cvai | kdb | grep vhost | awk '{print $5}' | awk
'BEGIN {ORS="\t"} {print}'`
integer VSCSIMAX=`lsdev | grep vscsi | grep "Virtual SCSI Client
Adapter" | grep Available | awk '{print$1'} | wc -l`

if [[ $VSCSIMAX -eq 0 ]]; then
        echo
        echo "vSCSI: There are not any vSCSI devices in this system!"
        echo
        else
        integer i=0
        echo
        echo
        echo "vSCSI Information:"
        echo
                while  [[ $i -lt $VSCSIMAX ]]
                do HWLOC[$i]=`lscfg -vps -l ${VSCSIDEV[$i]} | grep "Hardware Location Code" | awk '{sub("        Hardware Location Code......", ""); print}'`        
                echo "    Hardware Location              vSCSI             VIO vhost device                                            SERIAL"
                echo "${HWLOC[$i]}  ->  ${VSCSIDEV[$i]}   -> ${VIOVSCSI[$i]}"
                echo "                                   |"
                echo "                                   ---------> disks on ${VSCSIDEV[$i]}"
                for hdisk in `lspath | grep ${VSCSIDEV[$i]} | awk {'print$2'}`; do echo " "`lscfg -vps -l $hdisk | grep $hdisk` | awk '{ printf "%s ", $0 }';
SERIAL=`odmget -q "name=$hdisk and attribute=unique_id" CuAt |grep value | awk ' {print $3} ' | cut -c 11-42`; echo $SERIAL | awk '{ printf "%s ", $0 }'; echo; done;
                echo
                echo
                (( i = i + 1 ))
                done
        
fi

echo
echo "Done!"

exit 0
