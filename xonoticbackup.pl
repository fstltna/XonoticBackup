#!/usr/bin/perl

# Set these for your situation
my $XONOTICDIR = "/root/Xonotic";
my $BACKUPDIR = "/root/backups";
my $TARCMD = "/bin/tar czf";

#-------------------
# No changes below here...
#-------------------
my $VERSION = "1.1";

print "XonoticBackup.pl version $VERSION\n";
print "========================\n";
if (! -d $BACKUPDIR)
{
	print "Backup dir $BACKUPDIR not found, creating...\n";
	system("mkdir -p $BACKUPDIR");
}
print "Moving existing backups: ";

if (-f "$BACKUPDIR/xonoticbackup-5.tgz")
{
	unlink("$BACKUPDIR/xonoticbackup-5.tgz")  or warn "Could not unlink $BACKUPDIR/xonoticbackup-5.tgz: $!";
}
if (-f "$BACKUPDIR/xonoticbackup-4.tgz")
{
	rename("$BACKUPDIR/xonoticbackup-4.tgz", "$BACKUPDIR/xonoticbackup-5.tgz");
}
if (-f "$BACKUPDIR/xonoticbackup-3.tgz")
{
	rename("$BACKUPDIR/xonoticbackup-3.tgz", "$BACKUPDIR/xonoticbackup-4.tgz");
}
if (-f "$BACKUPDIR/xonoticbackup-2.tgz")
{
	rename("$BACKUPDIR/xonoticbackup-2.tgz", "$BACKUPDIR/xonoticbackup-3.tgz");
}
if (-f "$BACKUPDIR/xonoticbackup-1.tgz")
{
	rename("$BACKUPDIR/xonoticbackup-1.tgz", "$BACKUPDIR/xonoticbackup-2.tgz");
}
print "Done\nCreating New Backup: ";
system("$TARCMD $BACKUPDIR/xonoticbackup-1.tgz $XONOTICDIR");
print("Done!\n");
exit 0;
