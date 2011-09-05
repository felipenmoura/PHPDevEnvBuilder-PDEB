#!/bin/bash
clear
echo "-----------------------------------------------------------------------------"
echo "Updating the installer"
echo "-----------------------------------------------------------------------------"
zypper refresh
clear
echo "-----------------------------------------------------------------------------"
echo "Installing..............................................................MySQL"
echo "-----------------------------------------------------------------------------"
zypper in -l --recommends mysql-community-server mysql-community-server-client
echo "Configuring.............................................................MySQL"
/etc/init.d/mysql start
/usr/bin/mysql_secure_installation
clear
echo "-----------------------------------------------------------------------------"
echo "Installing...........................................................Postgres"
echo "-----------------------------------------------------------------------------"
zypper in -l --recommends postgresql postgresql-server
clear
echo "-----------------------------------------------------------------------------"
echo "Installing................................................................PHP"
echo "-----------------------------------------------------------------------------"
zypper in -l --recommends apache2-mod_php5 php5 php5-devel php5-mysql php5-pgsql php-pear php5-sqlite php5-phar php5-bcmath php5-curl php5-gd php5-mcrypt
clear
echo "-----------------------------------------------------------------------------"
echo "Installing.....................................................SQLite/SQLite3"
echo "-----------------------------------------------------------------------------"
zypper in -l --recommends sqlite3 sqlite3-devel
clear
echo "-----------------------------------------------------------------------------"
echo "Installing.............................................................XDebug"
echo "-----------------------------------------------------------------------------"
zypper in -l --recommends gcc gcc-c++ make
pecl update-channels
pecl install xdebug
src=`find /usr/ -name 'xdebug.so' 2> /dev/null`
echo zend_extension_ts=\"$src\" >> /etc/php5/conf.d/xdebug.ini
echo zend_extension=\"$src\" >> /etc/php5/conf.d/xdebug.ini
clear
echo "-----------------------------------------------------------------------------"
echo "Installing............................................................PHPUnit"
echo "-----------------------------------------------------------------------------"
pear channel-discover pear.phpunit.de
pear channel-discover pear.symfony-project.com
pear channel-discover components.ez.no
pear upgrade pear
pear config-set preferred_state beta
pear install --alldeps phpunit/PHPUnit
pear config-set preferred_state stable
clear
echo "-----------------------------------------------------------------------------"
echo "Installing........................................................GIT and SVN"
echo "-----------------------------------------------------------------------------"
zypper in -l git git-core subversion
clear
echo "-----------------------------------------------------------------------------"
echo "Restarting Apache............................................................"
echo "-----------------------------------------------------------------------------"
/etc/init.d/apache2 restart
clear
echo "-----------------------------------------------------------------------------"
echo "  FINISHED                                        I hope everything wentok :)"
echo "If you got doubts, suggestions or want to report a bug or idea, just email-me"
echo "cauanc@gmail.com"
echo "-----------------------------------------------------------------------------"
