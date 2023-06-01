<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Starter Page</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
		<div class="row">
			<div class="col-lg-3 col-6">
				<div class="small-box bg-info">
					<div class="inner">
						<h5 class="infoBox-title">현재 이용자 수</h5>
						<h3 class="infoBox-value">${infoBox.current}</h3>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-6">
				<div class="small-box bg-primary">
					<div class="inner">
						<h5 class="infoBox-title">전체 회원 수</h5>
						<h3 class="infoBox-value">${infoBox.all}</h3>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-6">
				<div class="small-box bg-warning">
					<div class="inner">
						<h5 class="infoBox-title">정지 회원 수</h5>
						<h3 class="infoBox-value">${infoBox.suspend}</h3>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-6">
				<div class="small-box bg-danger">
					<div class="inner">
						<h5 class="infoBox-title">탈퇴 회원 수</h5>
						<h3 class="infoBox-value">${infoBox.ban}</h3>
					</div>
				</div>
			</div>

		</div>
        <div class="row">
        	<div class="col-md-6">
		      <div class="card card-info">
				<div class="card-header">
					<h3 class="card-title">주간 이용자 수(명)</h3>
					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-card-widget="collapse">
							<i class="fas fa-minus"></i>
						</button>
						<button type="button" class="btn btn-tool" data-card-widget="remove">
							<i class="fas fa-times"></i>
						</button>
					</div>
				</div>
				<div class="card-body">
					<div class="chart"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
						<canvas id="lineChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 1084px;" width="1084" height="250" class="chartjs-render-monitor"></canvas>
					</div>
				</div>
			  </div>
			</div>
			<div class="col-md-6">
				<div class="card card-success">
	              <div class="card-header">
	                <h3 class="card-title">이용자 활동 현황</h3>
	                <div class="card-tools">
	                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
	                    <i class="fas fa-minus"></i>
	                  </button>
	                  <button type="button" class="btn btn-tool" data-card-widget="remove">
	                    <i class="fas fa-times"></i>
	                  </button>
	                </div>
	              </div>
	              <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
	                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block; width: 764px;" width="764" height="250" class="chartjs-render-monitor"></canvas>
	              </div>
	              <!-- /.card-body -->
	            </div>
			</div>
		</div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 