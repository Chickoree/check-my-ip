*** Settings ***
Documentation   Tests for the Login Page only. Successful logins are tested
...		under the tests for that specific user. Note, mobile tags can
...		only run on mobile devices, hence should be excluded when
...		testing desktop and/or tablet
Resource	../resources/login_resources.robot
Suite Setup	Open test browser
Suite Teardown	Teardown Browser

*** Test Cases ***
I can see my IP address
	Wait Until Keyword Succeeds	20s	1s	Element Should Be Visible	jquery=[id="ip-box"]
	I should see the "IP_DETAILS" page is responsive
