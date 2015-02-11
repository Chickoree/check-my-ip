





##  To run the Robot tests:

######  For Testing on Sauce Labs with Applitools
<pre>
        <code>
                pybot --outputdir robot_test_results/firefox --variable APPLITOOLS_KEY:'W9rjvR9QoMobiSrUeBNTDffNSRReSMDQ8PFvjopoM84110' --variable APPLITOOLS_APP_NAME:'Medullan' --variable SAUCE_URL:'http://Chickoree:d61c8e10-8463-43a7-8f87-c096dd42ade7@ondemand.saucelabs.com:80/wd/hub' --variable SAUCE_CAPABILITIES:'platform:OS X 10.9,browserName:firefox,version:33' --exclude ignore --argumentfile full_suite.txt
</pre>

######  For Local Testing without SauceLabs, but with Applitools
<pre>
        <code>
                pybot --outputdir robot_test_results/firefox --variable APPLITOOLS_KEY:'W9rjvR9QoMobiSrUeBNTDffNSRReSMDQ8PFvjopoM84110' --variable BROWSER:firefox --variable APPLITOOLS_APP_NAME:'Medullan' --exclude ignore --argumentfile full_suite.txt
        </code>
</pre>

<pre>
        <code>
                pybot --outputdir robot_test_results/firefox --variable BROWSER:firefox --exclude ignore --argumentfile full_suite.txt
        </code>
</pre>
