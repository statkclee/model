---
layout: page
title: 데이터 과학 -- 모형
---

> ### 기계와의 경쟁을 준비하며... AI is a Superpower {.callout}
>
> "고대에는 '땅'이 가장 중요했고 땅이 소수에게 집중되자 인간은 귀족과 평민으로 구분됐으며, 
> 근대에는 '기계'가 중요해지면서 기계가 소수에게 집중되자 인간은 자본가와 노동자 계급으로 구분됐다". 
> 이제는 **데이터**가 또 한번 인류를 구분하는 기준이 될 것이다. 
> 향후 데이터가 소수에게 집중되면 단순 계급에 그치는 게 아니라 데이터를 가진 종과 그렇지 못한 종으로 분류될 것이이다. [^joongang-yuval]
>
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [유발 하라리(Yuval Noah Harari)](https://www.youtube.com/watch?v=7Xs3auqcX7k) 
>
> "AI is a superpower!!!", 인공지능을 체득하면 슈퍼파워를 손에 쥘 것이다. 
> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - [Andrew Ng](https://twitter.com/andrewyng/status/728986380638916609)
> 
> 금수저, 은수저 슈퍼파워를 받은 사람과 기계학습을 통달한 흑수저들간의 무한경쟁이 드뎌 시작되었다. 물론, 
> 금수저를 입에 물고 기계학습을 통달한 사람이 가장 유리한 출발을 시작한 것도 사실이다.
>
> "The future is here, it's just not evenly distributed yet."  
> 
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - William Gibson


[^joongang-yuval]: ['사피엔스' 저자 유발 하라리 "인간을 해킹하는 시대가 온다", "머신러닝·AI·생물학 발전…뇌과학 이해도 한층 높여"](http://news.mk.co.kr/newsRead.php?year=2018&no=58432)


## 학습목차 

<div class = "row">
  <div class = "col-md-6">
**모형-I**

- [기계학습 개요](model-ml-intro.html)
    - [예측모형 파이프 - R 모형설계행렬(Recipe)](ml-r-design-matrix.html) 
- [**데이터 정제(Data Cleaning)**](model-data-cleaning.html)
- [데이터 품질(Data Quality)](model-data-quality.html)
- 모형 데이터 전처리 - Feature Engineering(피처 공학)
    - [클래스 불균형(Class imbalance)](model-class-imbalance.html)
    - [피처 공학(Feature Engineering)](model-feature-engineering.html)
    - [피처 공학 기법 - 직사각형 데이터프레임](model-feature-engineering-tech.html)
    - [피처 공학 - 선택 혹은 추출](model-feature-engineering-selection.html)
    - [피처 공학 - 변수선택 자동화](model-feature-engineering-automation.html)
- 탐색적 데이터분석(EDA)
    - [지도학습모형 &rarr; EDA - 포도주(`wine`)](model-eda-wine.html)
- **[`tidyverse` 모형 - `tidymodels`: `tidyverse` 성명서](tidyverse-model.html)**
    - [`caret` &rarr; `parsnip`](tidyverse-parsnip.html) 
    - [임직원 이탈 예측: `tidymodel`](tidyverse-parsnip-advanced.html): 2020-07-20
    - [`tidymodels`: 나무모형](model_tree_tidymodels.html), [나무모형 예측모형(CART, RF, ..., SGBM)](model_tree.html)
        - [나무모형과 생존분석의 만남](model_survival_tree.html)
        - [나무모형과 지리정보의 만남 - 서울 택시인기 지점 예측](model_geospatial_taxi.html)
    - [포켓몬 PCA](model-pokemon-unsupervised.html)        
    - [펭귄 성별예측모형: `tidymodels`](tidyverse-parsnip-penguin.html)
    - [펭귄 성별예측모형: `tidymodels` - Hyper Parameter](tidyverse-parsnip-penguin-hyper-parameter.html)
    - [펭귄 성별예측모형: `tidymodels` - RESTful API](tidyverse-parsnip-penguin-RESTful-api.html)
    - [`tidymodels` - MDP / DALEX](tidyverse-parsnip-DALEX.html)
        - [펭귄 성별예측모형 설명: `tidymodels` - MDP / DALEX](tidyverse-parsnip-penguin-DALEX.html)
    - [펭귄 성별예측모형: `tidyposterior`](model-tidyposterior.html)
    - [펭귄 성별예측모형: `tidymodels` - Shiny](tidyverse-parsnip-penguin-shiny.html)
- **GDPR**
    - [GDPR 벌금 예측모형: EDA](model-gdpr-fine.html)
    - [예측모형 GDPR: 설명가능한 특정 모형](model-gdpr-challenge.html)
    - [예측모형 GDPR: `tidymodels`](model-gdpr-regression.html): 2020-07-21
    - [책 저자 분류모형: `parsnip` + `tidytext` + `textrecipes`](tidyverse-parsnip-textrecipes.html) 
        - [GDPR powered by `tidymodels`, `shiny`, `dalex`, `plumber`](model-explain.html)
    - [예측모형 (caret+DALEX+biz) - 뉴욕과 SF 부동산](model-r2d3-dalex-with-biz.html) 
        + [DALEX - mpg(연비 데이터)](model-mpg-dalex.html)
        + [DALEX - R2D3, 뉴욕과 SF 부동산 분류 데이터](model-r2d3-dalex.html)
        + [DALEX + `caret` - R2D3, 뉴욕과 SF 부동산 분류 데이터](model-r2d3-caret-dalex.html)
        + [DALEX - $H_2O$, `mpg`와 `attrition` 데이터](model-h2o-dalex.html)
- 모형 시각화
    + [회귀모형 - `purrr` + `trelliscopejs`](model_purrr_trelliscopejs.html)
    + [비지도학습 tsne - `mtcars`](model_tsne_mtcars.html)
    + [만성 신부전증(Kidney) 예측 - LIME](model_kidney-lime.html)
- 모형 평가
    - [예측모형 가치(Business Value)](model-business-value.html)
- **모형 자동화(AutoML)**
    - [순수 $H_2 O$ AutoML](model-h2o-automl.html)
    - [`dplyr` + $H_2 O$ AutoML](model-dplyr-h2o-automl.html)
    - [기계학습 모형개발 30분 - `recipe` + $H_2 O$ AutoML](model-recipe-h2o-automl.html)
    - [기계학습 모형 배포](model-deploy.html)
    - [**앙상블(ensemble) 모형**](model-ensemble.html)
- **실무 모형**
    - **사기 탐지(Fraud Detection)**
        - [단변량/다변량 이상점 검출](https://statkclee.github.io/ml/ml-detect-outliers-mahalanobis.html) 
        - [어노말리(Anomaly) 탐지](model-anomaly.html) 
    - **[신용평점모형 개발](credit-scoring-model.html)**

  </div>
  <div class = "col-md-6">

**모형-II**

- **Oldest but Goodies - `caret`**
    - [`caret` 예측모형 맛보기](model-caret-intro.html)
    - [`caret` 예측모형 개발](model-caret-build.html)
    - [초모수 미세조정(Hyper Parameter Tuning)](model-hyper-parameter.html)    
    - [`caret` 예측모형 실전코드](model-caret-in-practice.html)
    - [틱택토(Tic-Tac-Toe) - `parsnip`](model-tictactoe-parsnip.html)
    - [서포트 벡터 머신(SVM)](model_svm.html)
    - [통계검정 &rarr; GLM](model-glm-testing.html)    
- **Many Models**    
    - [기계학습 - `gapminer` + `rsample` + `purrr`](model-ml-purrr.html) 
    - [`purrr` - 많은 모형(many models)](tidyverse-purrr-many-models.html) 
- **데이터베이스와 깔끔한 모형**
    - [데이터베이스 - `dplyr`](model-database-dplyr.html)
- **모형 인프라(Model Infrastructure)**
    - [`rsampling`](model-rsampling.html) 
    - [시계열 데이터 - 항공여객(Air Passenger) 데이터](model-rsampling-time-series.html) 
    - [항공여객 데이터 ARIMA 모형 - `rsample`](model_rsample-arima.html)    
- **[클라우드 컴퓨팅 환경](model-cloud-infra.html)**
    - [예측모형 AWS EC2](model-aws-ec2.html) 
- **[클라우데라 설명가능한 기계학습](model-cloudera.html)**
    + [고객이탈 - 로지스틱 회귀모형](model-cloudera-logistic.html)
    + [고객이탈 - Random Forest](model-cloudera-rf.html)
    + [고객이탈 - DALEX + LIME](model-cloudera-lime.html)
    + [고객이탈 - `tidymodels`](model-cloudera-tidymodels.html)
    + [고객이탈 - RESTful API 기본기 `plumber`](model-cloudera-plumber.html)
    + [고객이탈 - RESTful API 모형 배포 `plumber`](model-cloudera-plumber-api.html)
    + [고객이탈 - RESTful API 모형 배포 도커](model-cloudera-plumber-docker.html)
- **파이썬 실무 예측모형**
    - [파이썬 + R - 포도주 품질](model-python-wine.html) 
    - [파이썬 고객이탈 - `xgBoost`](model-python-churn.html) 
        - [파이썬 고객이탈 - `XGBoost` 초모수 튜닝](model-python-xgboost-hyper.html)
        - [R 고객이탈 - `xgBoost`](model-r-churn.html)
    - [파이썬 예측모형 - 시운전(Dry-Run)](model-python-predictive-model.html)
    - [파이썬 예측모형 - 생애주기(lifecycle)](model-python-predictive-model-lifecycle.html)
    - [파이썬 예측모형 - 교차검증(cross-validation)](model-python-cross-validation.html)
- **데이터 결합(Data Fusion) - 네트워크, 텍스트, 이미지, 시계열**
    - [캐글 - 전자상거래 옷 리뷰](model-kaggle-text.html) 
    - [예측모형 - 네트워크](model-network.html) 
    - [예측모형 - 데이터 융합(`tsne`)](model-tsne.html)

  </div>
</div>

