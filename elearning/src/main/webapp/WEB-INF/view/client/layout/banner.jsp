<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Hero Start -->
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 align-items-center">
            <div class="col-md-12 col-lg-7">
                <h4 class="mb-3 text-secondary">Study any topic, anytime</h4>
                <h1 class="mb-5 display-3 text-primary">Learn on your schedule</h1>
            </div>
            <div class="col-md-12 col-lg-5">
                <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active rounded">
                            <img src="/client/img/kh100.jpg"
                                 class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                            <a href="#" class="btn px-4 py-2 text-white rounded">Development</a>
                        </div>
                        <div class="carousel-item rounded">
                            <img src="/client/img/kh101.jpg" class="img-fluid w-100 h-100 rounded"
                                 alt="Second slide">
                            <a href="#" class="btn px-4 py-2 text-white rounded">Design</a>
                        </div>
                        <div class="carousel-item rounded">
                            <img src="/client/img/kh103.jpg" class="img-fluid w-100 h-100 rounded"
                                 alt="Second slide">
                            <a href="#" class="btn px-4 py-2 text-white rounded">IT</a>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Hero End -->