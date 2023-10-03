# utilities.R
# Helper functions for Shiny Car Predict 

get_prediction <- function (hp, 
                            wt, 
                            gear, 
                            disp) {
  hp <- as.integer(hp)
  wt <- as.numeric(wt)
  gear <- as.integer(gear)
  disp <- as.numeric(disp)
  
  query <- sprintf('[{"hp":%d, "wt":%f, "gear":%d, "disp":%f}]', hp, wt, gear, disp)
  POST_response <- POST(
    "http://posit2:3939/cars_predict/predict",
    add_headers(
      "Authorization" = "Key UdOtlVQfcM3U5Kvqqjt9mvRURnjNafT4",
      "Accept" = "application/json",
      "Content-Type" = "application/json",
      "x-requested-with" = "XMLHttpRequest"
    ),
    body = query
  )
  values <- (content(POST_response, "parsed"))[[1]]
  return(values)
}