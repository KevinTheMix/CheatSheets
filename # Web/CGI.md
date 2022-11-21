# CGI

## Environment

2014.06.12:

CGI scripts are placed in a cgi-bin directory by convention, eg _C:\Program Files\EasyPHP-5.3.2i\apache\cgi-bin_
Perl CGI scripts end with the _.cgi_ extension.

## Samples

2010.11.22: _print.cgi_

```cgi
#!/perl/bin/perl -wT
print "Content-type: text/html\n\n";
print "<h2>Hello, World!</h2>\n";
$a = 1;
$b = 2;
print $a + $b;
```
