{{define "disks"}}
<DiskConfiguration>
    <Disk wcm:action="add">
        <CreatePartitions>
            <CreatePartition wcm:action="add">
                <Type>Primary</Type>
                <Order>1</Order>
                <Size>350</Size>
            </CreatePartition>
            <CreatePartition wcm:action="add">
                <Order>2</Order>
                <Type>Primary</Type>
                <Extend>true</Extend>
            </CreatePartition>
        </CreatePartitions>
        <ModifyPartitions>
            <ModifyPartition wcm:action="add">
                <Active>true</Active>
                <Format>NTFS</Format>
                <Label>boot</Label>
                <Order>1</Order>
                <PartitionID>1</PartitionID>
            </ModifyPartition>
            <ModifyPartition wcm:action="add">
                <Format>NTFS</Format>
                <Label>{{.OSName}}</Label>
                <Letter>C</Letter>
                <Order>2</Order>
                <PartitionID>2</PartitionID>
            </ModifyPartition>
        </ModifyPartitions>
        <DiskID>0</DiskID>
        <WillWipeDisk>true</WillWipeDisk>
    </Disk>
    <WillShowUI>OnError</WillShowUI>
</DiskConfiguration>
<ImageInstall>
    <OSImage>
        <InstallTo>
            <DiskID>0</DiskID>
            <PartitionID>2</PartitionID>
        </InstallTo>
        <WillShowUI>OnError</WillShowUI>
        <InstallToAvailablePartition>false</InstallToAvailablePartition>
        <InstallFrom>
            <MetaData wcm:action="add">
                <Key>/IMAGE/NAME</Key>
                <Value>{{.WindowsImageName}}</Value>
            </MetaData>
        </InstallFrom>
    </OSImage>
</ImageInstall>
{{end}}