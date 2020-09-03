# #!/usr/bin/env python
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions


# Start the browser and login with standard_user
def login (user, password):
    print ('Starting the browser...')
    numberofItemsAdded = '0'
    numberofItemsRemoved = '6'
    # --uncomment when running in Azure DevOps.
    # options = ChromeOptions()
    # options.add_argument("--headless") 
    # driver = webdriver.Chrome(options=options)
    driver = webdriver.Chrome()
    print ('Browser started successfully. Navigating to the demo page to login.')
    driver.get('https://www.saucedemo.com/')

    print('logging in ')
    driver.find_element_by_css_selector("input[id='user-name']").send_keys(user)
    driver.find_element_by_css_selector("input[id='password']").send_keys(password)
    driver.find_element_by_css_selector("input#login-button.btn_action").click()
 
    print("login is successful for user : "+user)
    print ('Adding all items to cart...')
    
    while '6' != numberofItemsAdded:
        driver.find_element_by_css_selector("button.btn_primary.btn_inventory").click()
        numberofItemsAdded = driver.find_element_by_css_selector("div.shopping_cart_container.shopping_cart_container > a.shopping_cart_link.fa-layers.fa-fw > span.fa-layers-counter.shopping_cart_badge").text
        print("adding item to cart..."+numberofItemsAdded)

    assert "6" in numberofItemsAdded
    print ('All items added successfully :'+numberofItemsAdded)

    print ('removing all items from cart...')
    while '1' != numberofItemsRemoved:
        driver.find_element_by_css_selector("button.btn_secondary.btn_inventory").click()
        numberofItemsRemoved = driver.find_element_by_css_selector("div.shopping_cart_container.shopping_cart_container > a.shopping_cart_link.fa-layers.fa-fw > span.fa-layers-counter.shopping_cart_badge").text
        print ('Removing item from cart...'+numberofItemsRemoved)

    assert "1" in numberofItemsRemoved
    print ('No Items left in Cart')
    

login('standard_user', 'secret_sauce')
