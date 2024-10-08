# library(testthat); library(BiocNeighbors); source("setup.R"); source("test-ExhaustiveParam.R")

test_that("ExhaustiveParam construction behaves properly", {
    p <- ExhaustiveParam()
    expect_output(show(p), "ExhaustiveParam")
    expect_identical(bndistance(p), "Euclidean")

    p <- ExhaustiveParam(distance="Manhattan")
    expect_identical(bndistance(p), "Manhattan")
})

test_that("Cursory checks for ExhaustiveParam", {
    Y <- matrix(rnorm(10000), ncol=20)

    p <- ExhaustiveParam()
    out <- findKNN(Y, k=8, BNPARAM=p)
    expect_identical(ncol(out$distance), 8L)
    expect_identical(ncol(out$index), 8L)

    d <- median(out$distance[,ncol(out$distance)])
    allout <- findNeighbors(Y, threshold=d, BNPARAM=p)
    expect_identical(length(allout$distance), nrow(Y))
    expect_identical(length(allout$index), nrow(Y))
})

test_that("ExhaustiveParam queries behave with cosine distance", {
    Y <- matrix(rnorm(10000), ncol=20)
    Z <- matrix(rnorm(2000), ncol=20)

    p <- ExhaustiveParam(distance="Cosine")

    out <- queryKNN(Y, Z, k=8, BNPARAM=p)
    Y1 <- Y/sqrt(rowSums(Y^2))
    Z1 <- Z/sqrt(rowSums(Z^2))
    ref <- queryKNN(Y1, Z1, k=8, BNPARAM=p)
    expect_equal(out, ref)

    d <- median(out$distance[,ncol(out$distance)])
    allout <- queryNeighbors(Y, Z, threshold=d, BNPARAM=p)
    Y1 <- Y/sqrt(rowSums(Y^2))
    Z1 <- Z/sqrt(rowSums(Z^2))
    allref <- queryNeighbors(Y1, Z1, threshold=d, BNPARAM=p)
    expect_equal(out, ref)
})
