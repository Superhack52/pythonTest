import unittest
import os

import allure
from selenium import webdriver
from selenium.webdriver import DesiredCapabilities

from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class DemoAllure(unittest.TestCase):

    def test_site_loads(self):
        self.launch_site()
        self.verify_site()

    @allure.step("Launch site")
    def launch_site(self):
        self.driver = webdriver.Remote(
            command_executor=f'http://selenoid:4444/wd/hub',
            desired_capabilities=DesiredCapabilities.CHROME)
        self.driver.get("http://qaboy.com/")

    @allure.step("Verify Title loaded")
    def verify_site(self):
        wait = WebDriverWait(self.driver, 5)
        wait.until(EC.visibility_of_element_located((By.CLASS_NAME, "site-title")))


if __name__ == '__main__':
    unittest.main()
    print("Тест")