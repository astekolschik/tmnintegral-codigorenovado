<!-- Dashboard - main page - alert information -->

<div class="row">
	<div class="col-lg-3 col-xs-6">
		<!-- small box -->
		<div class="small-box bg-green">
			<div class="inner">
				<h3>
					${model.equipmentSize}
				</h3>
				<p>Equipos monitoreados</p>
			</div>
			<div class="icon">
				<i class="ion ion-stats-bars"></i>
			</div>
			<a href="javascript:displayLisEquipo();" class="small-box-footer">Mas informacion<i
				class="fa fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<div class="col-lg-3 col-xs-6">
		<!-- small box -->
		<div class="small-box bg-red">
			<div class="inner">
				<h3>${model.alarmsLastHr}</h3>
				<p>Alarmas generadas en la ultima hora</p>
			</div>
			<div class="icon">
				<i class="ion ion-pie-graph"></i>
			</div>
			<a href="javascript:displayAlarmasEnviadas();" class="small-box-footer">Mas informacion<i
				class="fa fa-arrow-circle-right"></i></a>
		</div>
	</div>
	<c:if test="${user.role_id == 1}">
		<div class="col-lg-3 col-xs-6">
			<!-- small box -->
			<div class="small-box bg-yellow">
				<div class="inner">
					<h3>${model.usersSize}</h3>
					<p>Usuarios en el sistema</p>
				</div>
				<div class="icon">
					<i class="ion ion-person-add"></i>
				</div>
				<a href="javascript:loadEnableUser();" class="small-box-footer">Mas Informacion<i
					class="fa fa-arrow-circle-right"></i></a>
			</div>
		</div>
	</c:if>
</div>


				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<section class="col-lg-7 connectedSortable">

						<!-- Alarmas -->
						<div class="box box-primary">
							<div class="box-header">
								<i class="ion ion-clipboard"></i>
								<h3 class="box-title">Alarmas enviadas</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<ul class="todo-list">
									<c:forEach items="${model.alarms}" var="a">
										<li>
											<span class="handle"> <i class="fa fa-ellipsis-v"></i> <i class="fa fa-ellipsis-v"></i></span> 
											<span class="text">{$a.elementName}</span> 
											<div class="tools">
												<i class="fa fa-edit" onclick="javascript:displayAlarmInfo({$a.id});"></i>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<!-- /.box -->
						<!-- Alarmas -->
						<div class="box box-primary">
							<div class="box-header">
								<i class="ion ion-clipboard"></i>
								<h3 class="box-title">Ultimos movimientos</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<ul class="todo-list">
									<c:forEach items="${model.logs}" var="log">
										<ul class="timeline">
										    <li class="time-label">
										        <span class="bg-red">
										            ${log.date}
										        </span>
										    </li>
										    <li>
										        <i class="fa fa-user bg-aqua"></i>
										        <div class="timeline-item">
										            <div class="timeline-body">
										                ${log.log_desc }
										            </div>
										        </div>
										    </li>
										</ul>
									</c:forEach>
								</ul>
							</div>
						</div>
					</section>
					<!-- /.Left col -->
					<!-- right col (We are only adding the ID to make the widgets sortable)-->
					<section class="col-lg-5 connectedSortable">
						<!-- solid sales graph -->
						<div class="box box-solid bg-teal-gradient">
							<div class="box-header">
								<i class="fa fa-th"></i>
								<h3 class="box-title">Sales Graph</h3>
								<div class="box-tools pull-right">
									<button class="btn bg-teal btn-sm" data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button class="btn bg-teal btn-sm" data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body border-radius-none">
								<div class="chart" id="line-chart" style="height: 250px;"></div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer no-border">
								<div class="row">
									<div class="col-xs-4 text-center"
										style="border-right: 1px solid #f4f4f4">
										<input type="text" class="knob" data-readonly="true"
											value="20" data-width="60" data-height="60"
											data-fgColor="#39CCCC">
										<div class="knob-label">Mail-Orders</div>
									</div>
									<!-- ./col -->
									<div class="col-xs-4 text-center"
										style="border-right: 1px solid #f4f4f4">
										<input type="text" class="knob" data-readonly="true"
											value="50" data-width="60" data-height="60"
											data-fgColor="#39CCCC">
										<div class="knob-label">Online</div>
									</div>
									<!-- ./col -->
									<div class="col-xs-4 text-center">
										<input type="text" class="knob" data-readonly="true"
											value="30" data-width="60" data-height="60"
											data-fgColor="#39CCCC">
										<div class="knob-label">In-Store</div>
									</div>
									<!-- ./col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</section>
					<!-- right col -->
				</div>
				<!-- /.row (main row) -->