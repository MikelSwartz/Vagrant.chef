curl -L https://www.opscode.com/chef/install.sh | bash
apt-get install git tree -y 
wget http://github.com/opscode/chef-repo/tarball/master
mkdir /root/chef-repo
tar -zxf master -C /root/
mv /root/chef-boneyard*/* /root/chef-repo/
rm /root/master /root/chef-boneyard* -rf
cd /root/chef-repo/
mkdir .chef
echo "cookbook_path [ '/root/chef-repo/cookbooks' ]" > .chef/knife.rb

cd /root/chef-repo/

echo <<END > solo.rb
file_cache_path \"/root/chef-solo\"
cookbook_path \"/root/chef-repo/cookbooks\"
END

echo <<END > web.json
{
	  "run_list": [ "recipe[apt]", "recipe[httpd]" ]
}
END

