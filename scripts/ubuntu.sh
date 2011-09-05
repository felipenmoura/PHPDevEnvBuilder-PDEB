#!/bin/bash
clear
echo "-----------------------------------------------------------------------------"
echo "Updating the installer"
echo "-----------------------------------------------------------------------------"
apt-get update
clear
echo "-----------------------------------------------------------------------------"
echo "Installing..............................................................MySQL"
echo "-----------------------------------------------------------------------------"
apt-get install mysql-server mysql-client
clear
echo "-----------------------------------------------------------------------------"
echo "Installing...........................................................Postgres"
echo "-----------------------------------------------------------------------------"
apt-get install postgresql
clear
echo "-----------------------------------------------------------------------------"
echo "Installing................................................................PHP"
echo "-----------------------------------------------------------------------------"
apt-get install apache2 php5 libapache2-mod-php5 php5-cli php5-mysql php5-pgsql php-pear php5-dev php5-sqlite
clear
echo "-----------------------------------------------------------------------------"
echo "Installing.....................................................SQLite/SQLite3"
echo "-----------------------------------------------------------------------------"
apt-get install libsqlite3-0 libsqlite3-dev
cd ~
wget http://pecl.php.net/get/sqlite3-0.6.tgz
tar -zxf sqlite3-0.6.tgz
cd sqlite3-0.6/
phpize
./configure
make
make install
echo extension=sqlite3.so >> /etc/php5/conf.d/sqlite3.ini
clear
echo "-----------------------------------------------------------------------------"
echo "Installing.............................................................XDebug"
echo "-----------------------------------------------------------------------------"
pecl install xdebug
src=`find / -name 'xdebug.so' 2> /dev/null`
echo zend_extension=\"$src\" >> /etc/php/apache2/php.ini
/etc/init.d/apache2 restart
clear
echo "-----------------------------------------------------------------------------"
echo "Installing............................................................PHPUnit"
echo "-----------------------------------------------------------------------------"
pear channel-discover pear.phpunit.de
pear install phpunit/PHPUnit
clear
echo "-----------------------------------------------------------------------------"
echo "Installing........................................................GIT and SVN"
echo "-----------------------------------------------------------------------------"
apt-get install git git-core
apt-get install subversion
clear
echo "-----------------------------------------------------------------------------"
echo "  FINISHED                                        I hope everything wentok :)"
echo "If you got doubts, suggestions or want to report a bug or idea, just email-me"
echo "felipenmoura@gmail.com"
echo "-----------------------------------------------------------------------------"
#apt-get install netbeans
