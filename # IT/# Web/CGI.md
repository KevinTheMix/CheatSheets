# CGI (Common Gateway Interface)

Standard protocol allowing web servers to execute programs/scripts to generate dynamic content in response to client requests, in a variety of languages (most often Perl).
The generated content can be HTML/XML, or any text/data (eg CSV, JSON, images, à la ASP's _ashx_).

* 2014.06.12
  * CGI scripts are placed in a cgi-bin directory by convention, eg _C:\Program Files\EasyPHP-5.3.2i\apache\cgi-bin_
  * Perl CGI scripts end with the _.cgi_ extension.

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
