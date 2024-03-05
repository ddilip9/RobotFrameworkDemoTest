# Robot Framework Demo

This is sample Robot Framework project, I have developed the below 3 test cases against [SauceDemo web app]( https://www.saucedemo.com).
    Scenario 1: Verify Cart Checkout
    Scenario 2: Verify Add all product and remove product
    Scenario 3: Verify Product Sorting/Filtering
This project is developed to demontrate Web UI automation using Robot Framework and Selenium library


## File organization
```
|- RobotFrameworkDemoTest/                      // Home folder for robotframework project
  |- Resources/Resource.robot                   // Test env and browser configurations
  |- Object-Repository/PageObjects/*.robot      // Page objects locators and keywords
  |- Tests/test.robot                           // Test cases agaist SauceDemo Web application
  |- Results                                    // Test Execution detailed reports
|- .gitignore                                   // Exclude the unnecessary files
|- README.md                                    // Overview and guideline to setup and run tests
```

## Installation
1. Download and Install [Python](https://www.python.org/downloads/).
2. Check Python installation

    `> python3 -V`

3. Install [pip](https://pip.pypa.io/en/stable/installation/).

    `> python get-pip3.py`

4. Install chromedriver and export to PATH

    See: https://chromedriver.chromium.org/downloads

5. Install Dependencies such as Selenuium Library from Pip3, datadriver etc

```
> pip3 install robotframework-seleniumlibrary
> pip install -U robotframework-datadriver[XLS]

```


## Run/Debug Test
1. Run/Debug using VSCODE or PYCHARM
2. Run all tests - `robot Tests/E-Commercetest.robot `
3. Run only tests with Tags - `robot --include=regression Tests/E-Commercetest.robot `
4. Run Tests Parallel - 'pabot --processes 2 Tests/E-CommerceTest/*.robot'



## Run Tests in parallel using Pabot plugin
1. install plugin pabot