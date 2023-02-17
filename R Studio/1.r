scores <- read.csv("1. Introduction/Score.csv", fileEncoding = 'UTF-8-BOM')
scoreWeights <- read.csv("1. Introduction/ScoreWeight.csv", fileEncoding = 'UTF-8-BOM')

summary = merge(scores, scoreWeights, by = "Course.Code")

summary$Total.Score <- round(
  (summary$Assignment.x * summary$Assignment.y) +
  (summary$Mid.Exam.x * summary$Mid.Exam.y) +
  (summary$Final.Exam.x * summary$Final.Exam.y))

determine <- function(input) {
  if(input >= 90) return("A")
  else if (input >= 85) return("A-")
  else if (input >= 80) return("B+")
  else if (input >= 75) return("B")
  else if (input >= 70) return("B-")
  else if (input >= 65) return("C")
  else if (input >= 50) return("D")
  else return("E")
}

summary$Grade = sapply(summary$Total.Score, determine)

df <- data.frame(Student.Name = summary$Student.Name, 
                 Course.Code = summary$Course.Code,
                 Total.Score = summary$Total.Score,
                 Grade = summary$Grade)

write.csv(df, "1. Introduction/result.csv", row.names = TRUE)
