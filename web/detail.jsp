<%-- 
    Document   : detail
    Created on : Mar 21, 2021, 3:54:23 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Education &mdash; HAT</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta
            name="description"
            content="Free HTML5 Website Template by freehtml5.co"
            />
        <meta
            name="keywords"
            content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive"
            />
        <meta name="author" content="freehtml5.co" />

        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content="" />
        <meta property="og:image" content="" />
        <meta property="og:url" content="" />
        <meta property="og:site_name" content="" />
        <meta property="og:description" content="" />
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <link
            href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css?family=Roboto+Slab:300,400"
            rel="stylesheet"
            />

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css" />
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css" />
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css" />

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.css" />

        <!-- Owl Carousel  -->
        <link rel="stylesheet" href="css/owl.carousel.min.css" />
        <link rel="stylesheet" href="css/owl.theme.default.min.css" />

        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css" />

        <!-- Pricing -->
        <link rel="stylesheet" href="css/pricing.css" />

        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css" />        
        <link rel="stylesheet" href="css/luyenthi.css" />


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>

        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
          <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div id="page">
            <jsp:include page="header.jsp"></jsp:include>    
                <div class="breadcrumb-wrap">
                    <div class="container-fluid">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="luyenthi.jsp">Thi THPT QG</a></li>
                            <li class="breadcrumb-item">Chi tiết đề thi</li>
                        </ul>
                    </div>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="detail col-md-9">
                            <h3 class="m-0">Đề thi thử THPTQG năm 2021 môn Tiếng Anh</h3>
                            <p>
                                <span>
                                    <i class="fa fa-clock"> </i>
                                    Cập nhật: 07:24 Ngày 18/03/2021
                                </span>  
                            </p>
                            <div class="detail-question">
                                <span class="mr-2"> 
                                    <i class="fa fa-bars"> </i>
                                    Môn:&nbsp;<a href="">Tiếng Anh</a>
                                </span>                            
                                <span class="mr-2">
                                    <i class="fa fa-list-alt"> </i>
                                    Số câu hỏi: 40 câu
                                </span>  
                                <span class="mr-2">
                                    <i class="fa fa-clock"> </i>
                                    Thời gian: 10 phút
                                </span>
                            </div>

                            <div class="regulation">
                                <h3>Hướng dẫn làm bài trắc nghiệm</h3>
                                <div class="instruction-box">
                                    1. Đợi đến khi đến thời gian làm bài
                                    <br/>
                                    <hr/>
                                    2. Click vào nút <b>Bắt đầu làm bài</b> để tiến hành làm bài thi
                                    <br/>
                                    <hr/>
                                    3. Ở mỗi câu hỏi, chọn đáp án đúng
                                    <br/>
                                    <hr/>
                                    4. Hết thời gian làm bài, hệ thống sẽ tự thu bài. Bạn có thể nộp bài trước khi thời gian kết thúc bằng cách nhấn nút <b>Nộp bài</b>
                                </div>
                                <p class="note m-0">
                                    Lưu ý:
                                </p>
                                <div class="note-content">
                                    Những câu <b>chưa chọn đáp án</b> sẽ được tính là <b>câu trả lời sai</b>
                                    <br/>
                                    Nếu bạn <b>thoát ra</b> trong lúc chưa hết thời gian làm bài thì kết quả <b>sẽ không được tính</b>
                                </div>
                            </div>
                            <div class="btn-group-do-exam">
                                <input class="btn-do-exam" type="button" value="Bắt đầu làm bài" />
                            </div>
                        </div>                   
                        <div class="charts col-md-3 p-0">
                            <header class="card-header">
                                <h2 class="m-0">Bảng xếp hạng</h2>
                            </header>
                            <div class="exam-top-list">
                                <div class="top-header">
                                    <div class="col name">Tên</div>
                                    <div class="col">Điểm</div>
                                    <div class="col">Thời gian</div>
                                </div>
                                <div class="exam-item">
                                    <div class="row-content">
                                        <div class="col name top1">
                                            <span>tonton</span>
                                        </div>
                                        <div class="col">10đ</div>
                                        <div class="col">40:35</div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="exam-item">
                                    <div class="row-content">
                                        <div class="col name top2">
                                            <span>hoanghuynh</span>
                                        </div>
                                        <div class="col">9đ</div>
                                        <div class="col">42:75</div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="exam-item">
                                    <div class="row-content">
                                        <div class="col name top3">
                                            <span>minhhoang</span>
                                        </div>
                                        <div class="col">8đ</div>
                                        <div class="col">44:75</div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="exam-item">
                                    <div class="row-content">
                                        <div class="col name top4">
                                            <span>annguyen</span>
                                        </div>
                                        <div class="col">7đ</div>
                                        <div class="col">44:75</div>
                                    </div>
                                </div>
                                <hr/>
                            </div>
                        </div>
                    </div>
                </div>
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- jQuery Easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Stellar Parallax -->
        <script src="js/jquery.stellar.min.js"></script>
        <!-- Carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Flexslider -->
        <script src="js/jquery.flexslider-min.js"></script>
        <!-- countTo -->
        <script src="js/jquery.countTo.js"></script>
        <!-- Magnific Popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <!-- Count Down -->
        <script src="js/simplyCountdown.js"></script>
        <!-- Main -->
        <script src="js/main.js"></script>
        <script>
            var d = new Date(new Date().getTime() + 1000 * 120 * 120 * 2000);

            // default example
            simplyCountdown(".simply-countdown-one", {
                year: d.getFullYear(),
                month: d.getMonth() + 1,
                day: d.getDate(),
            });

            //jQuery example
            $("#simply-countdown-losange").simplyCountdown({
                year: d.getFullYear(),
                month: d.getMonth() + 1,
                day: d.getDate(),
                enableUtc: false,
            });
        </script>
    </body>
</html>
