*** Settings ***
Documentation   Resources that are common for the app being tested
...
...             The system specific keywords created here form our own
...             domain specific language. They utilize keywords provided
...             by the imported Selenium2Library.
Library         Selenium2Library
Library         Collections
Library    	OperatingSystem
Library		DateTime
Library         RobotAppEyes
Library		SauceLabs
Variables	variables.py

*** Variables ***
${TEST_NAME}
${TEST TAGS}

*** Keywords ***
#   BEGIN GENERIC KEYWORDS
Open test browser
	[Documentation]    Open Browser ${BROWSER} to ${HOST} for testing ${SUITE_NAME}
	Create Directory	${OUTPUT DIR}/screenshots/${SUITE_NAME}/
	Run Keyword If  '${SAUCE_URL}' != ''	Open Browser    ${HOST}
	...   remote_url=${SAUCE_URL}
	...   desired_capabilities=${SAUCE_CAPABILITIES}
	Run Keyword If  '${SAUCE_URL}' == ''
	...   Open Browser    ${HOST}	browser=${BROWSER}
#	Run Keyword If	'${DEVICE}' == 'desktop'
	Maximize Browser Window
#	Run Keyword If	'${DEVICE}' == 'mobile'
#	...	Set Window Size	400	700
#	Run Keyword If	'${DEVICE}' == 'tablet'
#	...	Set Window Size	400	700
#	Maximize Browser Window

	Set Selenium Speed    ${SELENIUM_DELAY}
	Run Keyword If  '${APPLITOOLS_KEY}' != ''	Open Eyes Session
	...     url=${HOST}
	...     appname=${APPLITOOLS_APP_NAME}
	...     testname=${SUITE_NAME}
	...     apikey=${APPLITOOLS_KEY}
	...     matchlevel=${APPLITOOLS_MATCHLEVEL}
	...     includeEyesLog=${APPLITOOLS_EYESLOG}
	...     httpDebugLog=${APPLITOOLS_DEBUGLOG}

Teardown Take Failure Snapshot
	[Documentation]    ${SUITE_NAME} | ${SUITE_STATUS} | ${TEST_TAGS} | ${SAUCE_URL}
	Create Directory	${OUTPUT DIR}/screenshots/failed_tests/
	Run Keyword If Test Failed    Capture Screenshot    screenshots/failed_tests/${TEST_NAME}.png
	Run Keyword If  '${SAUCE_URL}' != ''	Report Sauce status
	...	${SUITE_NAME}	${SUITE_STATUS}	${TEST_TAGS}	${SAUCE_URL}
	Run Keyword If  '${APPLITOOLS_KEY}' != ''
	...   Run Keyword And Continue On Failure   Close Eyes Session
	Close all browsers

Teardown Browser
	[Documentation]    ${SUITE_NAME} | ${SUITE_STATUS} | ${TEST_TAGS} | ${SAUCE_URL}
	Run Keyword If  '${SAUCE_URL}' != ''	Report Sauce status
	...	${SUITE_NAME}	${SUITE_STATUS}	${TEST_TAGS}	${SAUCE_URL}
	Run Keyword If  '${APPLITOOLS_KEY}' != ''
	...   Run Keyword And Continue On Failure   Close Eyes Session
	Close all browsers

Take Screenshot of "${screenshot_name}" page
#	${current_date}=	Get Current Date	result_format=datetime
#	${date_string}=		Set Variable
#	...	${current_date.year}_${current_date.month}_${current_date.day}__${current_date.hour}
#	Create Directory	${OUTPUT DIR}/screenshots/${SUITE_NAME}/
	Capture Page Screenshot	screenshots/${SUITE_NAME}/${screenshot_name}
	Run keyword if  '${APPLITOOLS_KEY}' != ''
	...   Check Eyes Window     ${screenshot_name}    False

#UI Testing
I should see the "${page_name}" page
	Take Screenshot of "${page_name}.png" page

I should see the "${page_name}" page is responsive
	Set Window Size	767	600
	Take Screenshot of "mobile_${page_name}.png" page
	Set Window Size	991	600
	Take Screenshot of "tablet_${page_name}.png" page
	Maximize Browser Window
	Take Screenshot of "desktop_${page_name}.png" page

#Other Keywords
I enter the text "${text}" in the "${element_id}" textbox
	Input Text	jquery=[id="${element_id}"]	${text}

I click the "${button_id}" button
	Click Button	jquery=[id="${button_id}"]

I click the "${link_id}" link
	Click Link    	jquery=[id="${link_id}"]

I should see the element "${element_id}" displayed
	Element Should Be Visible  jquery=[id="${element_id}"]

I clear the text from the "${element_id}" textbox
	Input Text	jquery=[id="${element_id}"]	${EMPTY}

I click the jquery element "${jquery_string}"
	Click Element	jquery=${jquery_string}

I click the jquery link "${jquery_string}"
	Click Link	jquery=${jquery_string}

I click the jquery button "${jquery_string}"
	Click Button	jquery=${jquery_string}

I should see the jquery element "${jquery_string}" displayed
	Element Should Be Visible  jquery=${jquery_string}

I should NOT see the jquery element "${jquery_string}" displayed
	Element Should Not Be Visible  jquery=${jquery_string}

I clear the text from the jquery element "${jquery_string}"
	Input Text	jquery=${jquery_string}	${EMPTY}
