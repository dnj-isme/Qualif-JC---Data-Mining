install.packages("arules")
library("arules")

headers <- read.csv('3. Data Description and Frequent Pattern Analysis/header.csv', fileEncoding = 'UTF-8-BOM')
details <- read.csv('3. Data Description and Frequent Pattern Analysis/detail.csv', fileEncoding = 'UTF-8-BOM')
items <- read.csv('3. Data Description and Frequent Pattern Analysis/items.csv', fileEncoding = 'UTF-8-BOM')

# headers <- na.omit(headers)
# details <- na.omit(details)
# items <- na.omit(items)

transactions <- merge(headers, details, by.x = 'header_id', by.y = "transaction_id")
transactions <- merge(transactions, items, by.x = "item_id", by.y = "id")

transactions <- transactions[complete.cases(transactions), c('header_id', 'name')]

transactions <- split(transactions$name, transactions$header_id)

rules <- apriori(
  transactions, 
  parameter = list(
    support = 0.05, 
    target = 'frequent items'
    )
  )
inspect(rules)

assocRule <- ruleInduction(rules, confidence = 0.5)
inspect(assocRule)
