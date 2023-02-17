scores <- read.csv("1. Introduction/Score.csv", fileEncoding = 'UTF-8-BOM')
scoreWeights <- read.csv("1. Introduction/ScoreWeight.csv", fileEncoding = 'UTF-8-BOM')

summary = merge(scores, scoreWeights, by = "Course.Code")

summary$Total.Score <- round(
  (summary$Assignment.x * summary$Assignment.y) +
  (summary$Mid.Exam.x * summary$Mid.Exam.y) +
  (summary$Final.Exam.x * summary$Final.Exam.y))

for (i in 1:length(summary$Total.Score)) {
  input = summary$Total.Score[i]
  if(input >= 90) summary$Grade[i] <- "A"
  else if (input >= 85) summary$Grade[i] <- "A-"
  else if (input >= 80) summary$Grade[i] <- "B+"
  else if (input >= 75) summary$Grade[i] <- "B"
  else if (input >= 70) summary$Grade[i] <- "B-"
  else if (input >= 65) summary$Grade[i] <- "C"
  else if (input >= 50) summary$Grade[i] <- "D"
  else summary$Grade[i] <- "E"
}

df <- data.frame(Student.Name = summary$Student.Name, 
                 Course.Code = summary$Course.Code,
                 Total.Score = summary$Total.Score,
                 Grade = summary$Grade)

write.csv(df, "1. Introduction/result.csv", row.names = TRUE)
