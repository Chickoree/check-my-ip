





##  To run the Robot tests:

######  For Testing on Sauce Labs with Applitools
<pre>
        <code>
                pybot --outputdir robot_test_results/firefox --variable APPLITOOLS_KEY:'' --variable APPLITOOLS_APP_NAME:'' --variable SAUCE_URL:'' --variable SAUCE_CAPABILITIES:'platform:OS X 10.9,browserName:firefox,version:33' --exclude ignore --argumentfile full_suite.txt
</pre>

######  For Local Testing without SauceLabs, but with Applitools
<pre>
        <code>
                pybot --outputdir robot_test_results/firefox --variable APPLITOOLS_KEY:'' --variable BROWSER:firefox --variable APPLITOOLS_APP_NAME:'' --exclude ignore --argumentfile full_suite.txt
        </code>
</pre>

<pre>
        <code>
                pybot --outputdir robot_test_results/firefox --variable BROWSER:firefox --exclude ignore --argumentfile full_suite.txt
        </code>
</pre>
