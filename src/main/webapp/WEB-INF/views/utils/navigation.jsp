<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Sign Here</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">결재문 작성 <span class="sr-only">(current)</span></a></li>
          </ul>
          <ul class="nav nav-sidebar"> 
            <li><a onclick="changePage('myDraft','post')">내가보낸 결재</a></li>
            <li><a onclick="myEnforceMent();">내가보낸 시행문</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a onclick="waitApproval();">결재 대기함</a></li>
            <li><a onclick="approvalProcced();">결재 진행함</a></li>
            <li><a onclick="completeApproval();">완료 문서함</a></li>
            <li><a onclick="companionApproval();">반려 문서함</a></li>
            <li><a onclick="deferList();">보류 문서함</a></li>
            <li><a onclick="referenceApproval();">참조열람 문서함</a></li>
            <li><a onclick="receiveNotice();">공문 수신함</a></li>
            <li><a onclick="myList();">개인 보관함</a></li>
            <li><a onclick="setEntrust();">위임권 관리</a></li>
          </ul>
          
          <ul class="nav nav-sidebar">
            <li><a onclick="admin();">직원 관리</a></li>
            <li><a onclick="apListAdmin();">결재문서 관리</a></li>
          </ul>
        </div>
      </div>
    </div>