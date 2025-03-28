:local fileName "iran_ip_list.txt";
:local addressList "iran_ips";
:local lineDelimiter "\n";
:local filePointer [/file find name=$fileName];
:if ($filePointer != "") do={
    :local buffer [/file get $filePointer contents];
    :local bufferSize [:len $buffer];
    :local lineEnd 0;
    :local position 0;
    :do {
        :set lineEnd [:find $buffer $lineDelimiter $position];
        :local line [:pick $buffer $position $lineEnd];
        :set position ($lineEnd + [:len $lineDelimiter]);
        :if ([:len $line] > 0) do={
            /ip firewall address-list add list=$addressList address=$line;
        }
    } while ($position < $bufferSize)
}
