library(metaggR)

E1 = c(50, 134, 206, 290, 326, 374)
P1 = c(26, 92, 116, 218, 218, 206)
out1 = round(knowledge_weighted_estimate(E1,P1), 4)

E2 = c(50, 134, 206, 290, 326, 374, 200)
P2 = c(26, 92, 116, 218, 218, 206, 200)
out2 = round(knowledge_weighted_estimate(E2,P2), 4)

test_that("Expected output is found",
          {
            expect_equal(out1, 329.305)
            expect_equal(out2, 314.8606)
          })
