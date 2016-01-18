# -*- coding: utf-8 -*-

# Scrapy settings for autocrawler project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'autocrawler'

SPIDER_MODULES = ['autocrawler.spiders']
NEWSPIDER_MODULE = 'autocrawler.spiders'

ITEM_PIPELINES = {'autocrawler.pipelines.AutocrawlerPipeline': 0}

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'autocrawler (+http://www.yourdomain.com)'
