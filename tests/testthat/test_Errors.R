library(metaggR)

E = c(50, 134, 206, 290, 326, 374)
E_NA = c(50, 134, 206, 290, 326, NA)
P = c(26, 92, 116, 218, 218, 206)
P_NA = c(26, 92, 116, 218, 218, NA)

test_that("Expected errors have been found.",{
            expect_error(knowledge_weighted_estimate(E,P[-1]))
            expect_error(knowledge_weighted_estimate(E[-1],P))
            expect_error(knowledge_weighted_estimate(E[-c(1:3)],P[-c(1:3)]))
            expect_error(knowledge_weighted_estimate(matrix(E),matrix(P)))
            expect_error(knowledge_weighted_estimate(matrix(E),"P"))
            expect_error(knowledge_weighted_estimate(E,P_NA))
            expect_error(knowledge_weighted_estimate(E_NA,P))
})
