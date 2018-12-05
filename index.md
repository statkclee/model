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

- **모형 데이터 전처리 - Feature Engineering(피처 공학)**
    - [클래스 불균형(Class imbalance)](model-class-imbalance.html)
    - [피처 공학(Feature Engineering)](model-feature-engineering.html)
- **모형 인프라(Model Infrastructure)**
    - [`rsampling`](model-rsampling.html) 
    - [시계열 데이터 - 항공여객(Air Passenger) 데이터](model-rsampling-time-series.html) 
- **Oldest but Goodies - `caret`**
    - [`caret` 예측모형](model-caret.html)
- **탐색적 데이터분석(EDA)**
    - [지도학습모형 &rarr; EDA - 포도주(`wine`)](model-eda-wine.html)
- **[`tidyverse` 모형](tidyverse-model.html)**
    - [예측모형 파이프 - R 모형설계행렬(Recipe)](ml-r-design-matrix.html) 
    - [서포트 벡터 머신(SVM)](model_svm.html)
    - [항공여객 데이터 ARIMA 모형 - `rsample`](model_rsample-arima.html)
    - [나무모형 예측모형(CART, RF, ..., SGBM)](model_tree.html)
        - [나무모형과 생존분석의 만남](model_survival_tree.html)
        - [나무모형과 지리정보의 만남 - 서울 택시인기 지점 예측](model_geospatial_taxi.html)
    - [기계학습 - `gapminer` + `rsample` + `purrr`](model-ml-purrr.html) 
- **[GDPR - 모형 설명](model-explain.html)**
    - [예측모형 GDPR 도전](model-gdpr-challenge.html)
        - [연속형 변수 - 회귀모형](model-gdpr-regression.html)
    - [예측모형 (caret+DALEX+biz) - 뉴욕과 SF 부동산](model-r2d3-dalex-with-biz.html) 
        + [DALEX - mpg(연비 데이터)](model-mpg-dalex.html)
        + [DALEX - R2D3, 뉴욕과 SF 부동산 분류 데이터](model-r2d3-dalex.html)
        + [DALEX + `caret` - R2D3, 뉴욕과 SF 부동산 분류 데이터](model-r2d3-caret-dalex.html)
        + [DALEX - $H_2O$, `mpg`와 `attrition` 데이터](model-h2o-dalex.html)
    - **모형 시각화**
        + [회귀모형 - `purrr` + `trelliscopejs`](model_purrr_trelliscopejs.html)
        + [비지도학습 tsne - `mtcars`](model_tsne_mtcars.html)
        + [만성 신부전증(Kidney) 예측 - LIME](model_kidney-lime.html)
    - **클라우데라 설명가능한 기계학습**
        + [고객이탈 - 로지스틱 회귀모형](model-cloudera-logistic.html)
        + [고객이탈 - Random Forest](model-cloudera-rf.html)
        + [고객이탈 - DALEX + LIME](model-cloudera-lime.html)
- **모형 평가 및 활용**
    - [tidyposterior](model-tidyposterior.html)
    - [예측모형 가치(Business Value)](model-business-value.html)
- **모형 자동화(AutoML)**
    - [순수 $H_2 O$ AutoML](model-h2o-automl.html)
    - [`dplyr` + $H_2 O$ AutoML](model-dplyr-h2o-automl.html)
    - [기계학습 모형개발 30분 - `recipe` + $H_2 O$ AutoML](model-recipe-h2o-automl.html)
    - [기계학습 모형 배포](model-deploy.html)
- **컴퓨팅 환경**
    - [예측모형 AWS EC2](model-aws-ec2.html) 
- **R + 파이썬**
    - [파이썬 + R - 포도주 품질](model-python-wine.html) 
    - [파이썬 + R - 고객이탈 (xgBoost)](model-python-churn.html) 
- **네트워크, 텍스트, 이미지, 시계열**
    - [캐글 - 전자상거래 옷 리뷰](model-kaggle-text.html) 
    - [예측모형 - 네트워크](model-network.html) 
- **사기 탐지(Fraud Detection)**
    - [단변량/다변량 이상점 검출](https://statkclee.github.io/ml/ml-detect-outliers-mahalanobis.html) 
    - [어노말리(Anomaly) 탐지](model-anomaly.html) 


### [xwMOOC 오픈 교재](https://statkclee.github.io/xwMOOC/)

- **컴퓨팅 사고력(Computational Thinking)**
    - [컴퓨터 과학 언플러그드](http://statkclee.github.io/unplugged)  
    - [리보그 - 프로그래밍과 문제해결](https://statkclee.github.io/code-perspectives/)  
         - [러플](http://statkclee.github.io/rur-ple/)  
    - [파이썬 거북이](http://swcarpentry.github.io/python-novice-turtles/index-kr.html)  
    - [정보과학을 위한 파이썬](https://statkclee.github.io/pythonlearn-kr/)  
        + [정보 과학을 위한 R - R for Informatics](https://statkclee.github.io/r4inf/)
    - [소프트웨어 카펜트리 5.3](http://statkclee.github.io/swcarpentry-version-5-3-new/)
    - [기호 수학(Symbolic Math)](https://statkclee.github.io/symbolic-math/)
    - [데이터 과학을 위한 R 알고리즘](https://statkclee.github.io/r-algorithm/)
    - [데이터 과학을 위한 저작도구](https://statkclee.github.io/ds-authoring/)
        - [The Official xwMOOC Blog](https://xwmooc.netlify.com/)
    - [비즈니스를 위한 오픈 소스 소프트웨어](http://statkclee.github.io/open-source-for-business/)    
- **데이터 과학**
    - [R 데이터과학](https://statkclee.github.io/data-science/)
    - [시각화](https://statkclee.github.io/viz/)
    - [데이터 과학– 기초 통계](https://statkclee.github.io/statistics/)    
        - [공개 기초 통계학 - OpenIntro Statistics](https://statkclee.github.io/openIntro-statistics-bookdown/)
    - [보안 R](https://statkclee.github.io/security/) - TBA
    - **다양한 데이터**
        + [텍스트 - 자연어처리(NLP)](https://statkclee.github.io/text/)
        + [네트워크(network)](https://statkclee.github.io/network)
        + [공간통계를 위한 데이터 과학](https://statkclee.github.io/spatial/)        
        + [고생대 프로젝트](http://statkclee.github.io/trilobite)
        + [금융(finance)](https://statkclee.github.io/finance/)
        + [자동차 데이터 분석](https://statkclee.github.io/automotive/)
        + 비즈니스 프로세스(Business Process) - bupar
    - **모형**
        + [데이터 과학 - 모형](https://statkclee.github.io/model/)
    - [~~R 팩키지~~](http://r-pkgs.xwmooc.org/)
    - [~~통계적 사고~~](http://think-stat.xwmooc.org/)
- **빅데이터**
    - [빅데이터(Big Data)](http://statkclee.github.io/bigdata)
    - [데이터 제품](https://statkclee.github.io/data-product/)
    - [R 도커](http://statkclee.github.io/r-docker/)
- **기계학습, 딥러닝, 인공지능**
    - [고성능 컴퓨팅(HPC)](http://statkclee.github.io/hpc)
    - [기계학습](http://statkclee.github.io/ml)
    - [딥러닝](http://statkclee.github.io/deep-learning)
    - [R 병렬 프로그래밍](http://statkclee.github.io/parallel-r/)
    - [인공지능 연구회](https://statkclee.github.io/ai-lab/)
- [IoT 오픈 하드웨어(라즈베리 파이)](http://statkclee.github.io/raspberry-pi)
    - [$100 오픈 컴퓨터](https://statkclee.github.io/one-page/)   
    - [$100 오픈 슈퍼컴퓨터](https://statkclee.github.io/hpc/)
- [선거와 투표](http://statkclee.github.io/politics)
    - [저녁이 있는 삶과 새판짜기 - 제7공화국](https://statkclee.github.io/hq/)


- [컴퓨터 과학 언플러그드](http://unplugged.xwmooc.org)  
- [리보그](http://reeborg.xwmooc.org)  
     - [러플](http://rur-ple.xwmooc.org)  
- [파이썬 거북이](http://swcarpentry.github.io/python-novice-turtles/index-kr.html)  
- [정보과학을 위한 파이썬](http://python.xwmooc.org)  
- [소프트웨어 카펜트리 5.3](http://swcarpentry.xwmooc.org)
- [IoT 오픈 하드웨어(라즈베리 파이)](https://statkclee.github.io/raspberry-pi/)
    - [$100 오픈 컴퓨터](http://computer.xwmooc.org/)   
    - [$100 오픈 슈퍼컴퓨터](http://computers.xwmooc.org/)
- **데이터 과학**
    - [R 데이터과학](http://statkclee.github.io/data-science)
    - [R 팩키지](http://r-pkgs.xwmooc.org/)
    - [R 도커](http://statkclee.github.io/r-docker/)
    - [통계적 사고](http://think-stat.xwmooc.org/)
    - [데이터 과학을 위한 저작도구](https://statkclee.github.io/ds-authoring/)

- **기계학습, 딥러닝, 인공지능**
    - [R 병렬 컴퓨팅](http://statkclee.github.io/parallel-r)
    - [데이터 과학자가 바라본 기계학습](https://statkclee.github.io/ml/)
    - [xwMOOC 딥러닝](https://statkclee.github.io/deep-learning/)
    - [고생대 프로젝트](http://statkclee.github.io/trilobite)
- [기호 수학(Symbolic Math)](http://sympy.xwmooc.org/)
- [선거와 투표](http://politics.xwmooc.org/)

