package com.resustainability.reisp.model;

public class User {

	private String user_id,user_name,user_role,user_session_id,otp_code,department_name,reporting_user_name,minutes,assigned_to_sbu,sbu_code,project,sbu,gToken,reporting_to,reporting_to_id,profileImg,current_project,id,	last_login_date_time,totalCount,password,email_id,mobile_number,user_name_new,designation_new,email_new,contact_number,totalUers,count,
	company_code,	project_code,department_code,sub_code,action,	project_name,	status,	created_date,	created_by,	modified_date,	modified_by,all_users,active_users,inActive_users,
	location_code,	location_name,	company_name,module_id,	module_type,role,p_add,p_view,p_edit,p_approvals,p_reports,p_dashboards,p_auto_email,
	base_sbu,base_project,base_role,message,created_datetime,version_no,expired_datetime,sbu_name,end_date,days,hours,last_login,create_date,reward_points,last_sync_time,	user_login_time,base_department,	user_logout_time,device_type,device_type_no,
	module_name,module_url,timePeriod
    ,emp_code
    ,punch_time
    ,punch_state
    ,verify_type
    ,work_code
    ,terminal_sn
    ,terminal_alias
    ,area_alias
    ,longitude
    ,latitude
    ,gps_location
    ,mobile
    ,source
    ,purpose
    ,crc
    ,is_attendance
    ,reserved
    ,upload_time
    ,sync_status
    ,sync_time
    ,emp_id
    ,terminal_id
    ,company_id
    ,mask_flag
    ,temperature
    ,last_insert_narella_id
    ,generated_by;
	int session_count,time_period;
	
	public String getEmp_code() {
		return emp_code;
	}

	public void setEmp_code(String emp_code) {
		this.emp_code = emp_code;
	}

	public String getPunch_time() {
		return punch_time;
	}

	public void setPunch_time(String punch_time) {
		this.punch_time = punch_time;
	}

	public String getPunch_state() {
		return punch_state;
	}

	public void setPunch_state(String punch_state) {
		this.punch_state = punch_state;
	}

	public String getVerify_type() {
		return verify_type;
	}

	public void setVerify_type(String verify_type) {
		this.verify_type = verify_type;
	}

	public String getWork_code() {
		return work_code;
	}

	public void setWork_code(String work_code) {
		this.work_code = work_code;
	}

	public String getTerminal_sn() {
		return terminal_sn;
	}

	public void setTerminal_sn(String terminal_sn) {
		this.terminal_sn = terminal_sn;
	}

	public String getTerminal_alias() {
		return terminal_alias;
	}

	public void setTerminal_alias(String terminal_alias) {
		this.terminal_alias = terminal_alias;
	}

	public String getArea_alias() {
		return area_alias;
	}

	public void setArea_alias(String area_alias) {
		this.area_alias = area_alias;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getGps_location() {
		return gps_location;
	}

	public void setGps_location(String gps_location) {
		this.gps_location = gps_location;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getCrc() {
		return crc;
	}

	public void setCrc(String crc) {
		this.crc = crc;
	}

	public String getIs_attendance() {
		return is_attendance;
	}

	public void setIs_attendance(String is_attendance) {
		this.is_attendance = is_attendance;
	}

	public String getReserved() {
		return reserved;
	}

	public void setReserved(String reserved) {
		this.reserved = reserved;
	}

	public String getUpload_time() {
		return upload_time;
	}

	public void setUpload_time(String upload_time) {
		this.upload_time = upload_time;
	}

	public String getSync_status() {
		return sync_status;
	}

	public void setSync_status(String sync_status) {
		this.sync_status = sync_status;
	}

	public String getSync_time() {
		return sync_time;
	}

	public void setSync_time(String sync_time) {
		this.sync_time = sync_time;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}

	public String getTerminal_id() {
		return terminal_id;
	}

	public void setTerminal_id(String terminal_id) {
		this.terminal_id = terminal_id;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getMask_flag() {
		return mask_flag;
	}

	public void setMask_flag(String mask_flag) {
		this.mask_flag = mask_flag;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getLast_insert_narella_id() {
		return last_insert_narella_id;
	}

	public void setLast_insert_narella_id(String last_insert_narella_id) {
		this.last_insert_narella_id = last_insert_narella_id;
	}

	public String getGenerated_by() {
		return generated_by;
	}

	public void setGenerated_by(String generated_by) {
		this.generated_by = generated_by;
	}

	public String getVersion_no() {
		return version_no;
	}

	public void setVersion_no(String version_no) {
		this.version_no = version_no;
	}

	public String getCreated_datetime() {
		return created_datetime;
	}

	public void setCreated_datetime(String created_datetime) {
		this.created_datetime = created_datetime;
	}

	public String getExpired_datetime() {
		return expired_datetime;
	}

	public void setExpired_datetime(String expired_datetime) {
		this.expired_datetime = expired_datetime;
	}

	public String getLast_sync_time() {
		return last_sync_time;
	}

	public void setLast_sync_time(String last_sync_time) {
		this.last_sync_time = last_sync_time;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getReporting_user_name() {
		return reporting_user_name;
	}

	public void setReporting_user_name(String reporting_user_name) {
		this.reporting_user_name = reporting_user_name;
	}

	public String getOtp_code() {
		return otp_code;
	}

	public void setOtp_code(String otp_code) {
		this.otp_code = otp_code;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getAssigned_to_sbu() {
		return assigned_to_sbu;
	}

	public void setAssigned_to_sbu(String assigned_to_sbu) {
		this.assigned_to_sbu = assigned_to_sbu;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getSbu_code() {
		return sbu_code;
	}

	public void setSbu_code(String sbu_code) {
		this.sbu_code = sbu_code;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getSbu() {
		return sbu;
	}

	public void setSbu(String sbu) {
		this.sbu = sbu;
	}

	public String getReward_points() {
		return reward_points;
	}

	public void setReward_points(String reward_points) {
		this.reward_points = reward_points;
	}

	public String getDepartment_code() {
		return department_code;
	}

	public void setDepartment_code(String department_code) {
		this.department_code = department_code;
	}

	public String getSub_code() {
		return sub_code;
	}

	public void setSub_code(String sub_code) {
		this.sub_code = sub_code;
	}

	public String getTimePeriod() {
		return timePeriod;
	}

	public void setTimePeriod(String timePeriod) {
		this.timePeriod = timePeriod;
	}

	public String getMinutes() {
		return minutes;
	}

	public void setMinutes(String minutes) {
		this.minutes = minutes;
	}

	public String getLast_login() {
		return last_login;
	}

	public void setLast_login(String last_login) {
		this.last_login = last_login;
	}

	public int getTime_period() {
		return time_period;
	}

	public void setTime_period(int time_period) {
		this.time_period = time_period;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getBase_department() {
		return base_department;
	}

	public void setBase_department(String base_department) {
		this.base_department = base_department;
	}

	public String getSbu_name() {
		return sbu_name;
	}

	public void setSbu_name(String sbu_name) {
		this.sbu_name = sbu_name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getP_add() {
		return p_add;
	}

	public void setP_add(String p_add) {
		this.p_add = p_add;
	}

	public String getP_view() {
		return p_view;
	}

	public void setP_view(String p_view) {
		this.p_view = p_view;
	}

	public String getP_edit() {
		return p_edit;
	}

	public void setP_edit(String p_edit) {
		this.p_edit = p_edit;
	}

	public String getP_approvals() {
		return p_approvals;
	}

	public void setP_approvals(String p_approvals) {
		this.p_approvals = p_approvals;
	}

	public String getP_reports() {
		return p_reports;
	}

	public void setP_reports(String p_reports) {
		this.p_reports = p_reports;
	}

	public String getP_dashboards() {
		return p_dashboards;
	}

	public void setP_dashboards(String p_dashboards) {
		this.p_dashboards = p_dashboards;
	}

	public String getP_auto_email() {
		return p_auto_email;
	}

	public void setP_auto_email(String p_auto_email) {
		this.p_auto_email = p_auto_email;
	}

	public String getBase_sbu() {
		return base_sbu;
	}

	public void setBase_sbu(String base_sbu) {
		this.base_sbu = base_sbu;
	}

	public String getBase_project() {
		return base_project;
	}

	public void setBase_project(String base_project) {
		this.base_project = base_project;
	}

	public String getBase_role() {
		return base_role;
	}

	public void setBase_role(String base_role) {
		this.base_role = base_role;
	}

	public String getReporting_to_id() {
		return reporting_to_id;
	}

	public void setReporting_to_id(String reporting_to_id) {
		this.reporting_to_id = reporting_to_id;
	}

	public String getAll_users() {
		return all_users;
	}

	public void setAll_users(String all_users) {
		this.all_users = all_users;
	}

	public String getActive_users() {
		return active_users;
	}

	public void setActive_users(String active_users) {
		this.active_users = active_users;
	}

	public String getInActive_users() {
		return inActive_users;
	}

	public void setInActive_users(String inActive_users) {
		this.inActive_users = inActive_users;
	}

	public String getModule_name() {
		return module_name;
	}

	public void setModule_name(String module_name) {
		this.module_name = module_name;
	}

	public String getModule_url() {
		return module_url;
	}

	public void setModule_url(String module_url) {
		this.module_url = module_url;
	}

	public int getSession_count() {
		return session_count;
	}

	public void setSession_count(int session_count) {
		this.session_count = session_count;
	}

	public String getDevice_type_no() {
		return device_type_no;
	}

	public void setDevice_type_no(String device_type_no) {
		this.device_type_no = device_type_no;
	}

	public String getDevice_type() {
		return device_type;
	}

	public void setDevice_type(String device_type) {
		this.device_type = device_type;
	}

	public String getUser_session_id() {
		return user_session_id;
	}

	public void setUser_session_id(String user_session_id) {
		this.user_session_id = user_session_id;
	}

	public String getgToken() {
		return gToken;
	}

	public void setgToken(String gToken) {
		this.gToken = gToken;
	}

	public String getModule_id() {
		return module_id;
	}

	public void setModule_id(String module_id) {
		this.module_id = module_id;
	}

	public String getModule_type() {
		return module_type;
	}

	public void setModule_type(String module_type) {
		this.module_type = module_type;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getUser_login_time() {
		return user_login_time;
	}

	public void setUser_login_time(String user_login_time) {
		this.user_login_time = user_login_time;
	}

	public String getUser_logout_time() {
		return user_logout_time;
	}

	public void setUser_logout_time(String user_logout_time) {
		this.user_logout_time = user_logout_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLast_login_date_time() {
		return last_login_date_time;
	}

	public void setLast_login_date_time(String last_login_date_time) {
		this.last_login_date_time = last_login_date_time;
	}

	public String getUser_role() {
		return user_role;
	}

	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}

	public String getReporting_to() {
		return reporting_to;
	}

	public void setReporting_to(String reporting_to) {
		this.reporting_to = reporting_to;
	}

	public String getCurrent_project() {
		return current_project;
	}

	public void setCurrent_project(String current_project) {
		this.current_project = current_project;
	}

	public String getContact_number() {
		return contact_number;
	}

	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}

	public String getCompany_code() {
		return company_code;
	}

	public void setCompany_code(String company_code) {
		this.company_code = company_code;
	}

	public String getProject_code() {
		return project_code;
	}

	public void setProject_code(String project_code) {
		this.project_code = project_code;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public String getModified_date() {
		return modified_date;
	}

	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}

	public String getModified_by() {
		return modified_by;
	}

	public void setModified_by(String modified_by) {
		this.modified_by = modified_by;
	}

	public String getLocation_code() {
		return location_code;
	}

	public void setLocation_code(String location_code) {
		this.location_code = location_code;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getTotalUers() {
		return totalUers;
	}

	public void setTotalUers(String totalUers) {
		this.totalUers = totalUers;
	}

	public String getUser_name_new() {
		return user_name_new;
	}

	public void setUser_name_new(String user_name_new) {
		this.user_name_new = user_name_new;
	}

	public String getDesignation_new() {
		return designation_new;
	}

	public void setDesignation_new(String designation_new) {
		this.designation_new = designation_new;
	}

	public String getEmail_new() {
		return email_new;
	}

	public void setEmail_new(String email_new) {
		this.email_new = email_new;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}



	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getMobile_number() {
		return mobile_number;
	}

	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}
	
}
