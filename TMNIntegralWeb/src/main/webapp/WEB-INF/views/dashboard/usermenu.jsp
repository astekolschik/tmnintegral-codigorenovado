<!-- sidebar menu: : style can be found in sidebar.less -->
<ul class="sidebar-menu">
	<li class="header">Menú Principal</li>
	<c:if test="${user.role.role_id == 0}">
		<li><a href="javascript:loadClients();"> <i class="fa fa-th"></i> <span>Clientes</span>
		</a></li>
	</c:if>
	<c:if test="${user.role.role_id != 0}">
		<c:if test="${not empty user}">
			<li class="active treeview"><a href="#"> <i
					class="fa fa-dashboard"></i> <span>Usuario</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="javascript:loadChgUser();"><i
							class="fa fa-circle-o"></i>Modificar</a></li>
					<c:if test="${user.role.role_id == 1}">
						<li><a href="javascript:loadDeleteUser();"><i
								class="fa fa-circle-o"></i>Eliminar Usuarios</a></li>
						<li><a href="javascript:loadEnableUser();"><i
								class="fa fa-circle-o"></i>Modificar Usuarios</a></li>
						<li><a href="javascript:loadAllowUser();"><i
								class="fa fa-circle-o"></i>Habilitar Usuarios</a></li>
					</c:if>
				</ul></li>
		</c:if>
		<c:if test="${user.role.role_id == 1 or user.role.role_id == 2}">
			<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i><span>Inventario</span><i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="javascript:displayLisTipoEquipo();"><i
							class="fa fa-circle-o"></i>Tipos de Equipo</a></li>
					<li><a href="javascript:displayLisEquipo();"><i
							class="fa fa-circle-o"></i>Equipos</a></li>
					<li><a href="javascript:displayInterfaces();"><i
							class="fa fa-circle-o"></i>Interfaces</a></li>
					<li><a href="javascript:displayRedes();"><i
							class="fa fa-circle-o"></i>Redes</a></li>
					<li><a href="javascript:displayTopologiaRed();"><i
							class="fa fa-circle-o"></i>Topología de Red</a></li>
				</ul></li>
 			<li class="treeview"><a href="javascript:displayInProgress();">
 					<i class="fa fa-files-o"></i><span>Configuracion</span><i
 					class="fa fa-angle-left pull-right"></i>
	 			</a>
 				<ul class="treeview-menu">
					<li><a href="javascript:displayConfiguracion();"><i
							class="fa fa-circle-o"></i>Comandos</a></li>
				</ul>
 			</li>
		</c:if>
		<!-- <li><a href="pages/widgets.html"> <i class="fa fa-th"></i>
								<span>Widgets</span> <small class="label pull-right bg-green">new</small>
						</a></li> -->
		<li class="treeview"><a href="#"> <i class="fa fa-files-o"></i><span>Monitoreo</span><i
				class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a href="javascript:displayInicioReportes();"><i
						class="fa fa-circle-o"></i>Reportes</a></li>
				<li><a href="javascript:displayAlarmasEnviadas();"><i
						class="fa fa-circle-o"></i>Alarmas Enviadas</a></li>
				<li><a href="javascript:configurarAlarmas();"><i
						class="fa fa-circle-o"></i>Configurar Alarmas</a></li>
			</ul></li>
	</c:if>
	<li><a href="logout.htm"> <i class="fa fa-th"></i> <span>Cerrar
				sesion</span>
	</a></li>
</ul>