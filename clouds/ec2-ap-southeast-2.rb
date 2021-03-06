name "ec2-ap-southeast-2"
description "Amazon Web Services - AP Southeast 2 Region (Sydney)"
auth "ec2secretkey"

image_map = '{
      "windows-2008r2":"ami-6cb90605",
      "centos-6.3":"ami-a96b01c0",
      "centos-6.4":"ami-eb6b0182",
      "centos-7.0":"ami-bd721587",
      "centos-7.2":"ami-9d500bfe",
      "ubuntu-14.04":"ami-7388cd19",
      "ubuntu-13.04":"ami-4bb39522",
      "ubuntu-12.10":"ami-ef1f3a86",
      "ubuntu-12.04":"ami-d9a98cb0",
      "ubuntu-10.04":"ami-25a5804c",
      "redhat-6.4":"ami-a25415cb",
      "redhat-6.3":"ami-a35a33ca",
      "redhat-6.2":"ami-876c05ee",
      "redhat-5.9":"ami-cf5b32a6",
      "fedora-19":"ami-b22e5cdb",
      "fedora-18":"ami-b71078de"
    }'

repo_map = '{
      "centos-6.3":"yum -d0 -e0 -y install rsync; rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm",
      "centos-6.4":"yum -d0 -e0 -y install rsync; rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm",
      "centos-7.0":"sudo yum clean all; sudo yum -d0 -e0 -y install rsync yum-utils; sudo yum -d0 -e0 -y install epel-release; sudo yum -d0 -e0 -y install gcc-c++",
      "centos-7.2":"sudo yum clean all; sudo yum -d0 -e0 -y install rsync yum-utils; sudo yum -d0 -e0 -y install epel-release; sudo yum -d0 -e0 -y install gcc-c++"
}'

service "ap-southeast-2",
  :cookbook => 'ec2',
  :provides => { :service => 'compute' },
  :source => [Chef::Config[:register], Chef::Config[:version].split(".").first].join('.'),
  :attributes => {
    :region => 'ap-southeast-2',
    :availability_zones => "[\"ap-southeast-2a\",\"ap-southeast-2b\",\"ap-southeast-2c\"]",
    :imagemap => image_map,
    :repo_map => repo_map
  }
