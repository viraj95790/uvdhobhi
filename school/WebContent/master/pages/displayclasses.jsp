
<%@ taglib uri="/struts-tags" prefix="s" %>

<section class="two miniheaight">

	<div class="container-fluid">
		<header>
			<h2 class="stephedpa text-left">Classes List</h2>
		</header>




		

		<div class="col-lg-4 col-md-12 col-sm-12 paddingnil">
			<div class="tile-body">
				<div class="table-condensed">

					<table class="table table-custom" id="editable-usage">

						<tr>

							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Class</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Result Date</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Edit</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Delete</th>

						</tr>


						<s:iterator value="getclasslist" status="status">


							<tr>

								<td><s:property value="classname" /></td>
								<td><s:property value="result_date" /></td>
								
								<s:url action="editstandardMaster" id="edit">
											<s:param name="selectedid" value="%{id}"></s:param>
										</s:url>
										<td><s:a href="%{edit}" cssClass="btn btn-info btn-xs">Edit</s:a></td>

										<s:url action="deletestandardMaster" id="delete">
											<s:param name="selectedid" value="%{id}"></s:param>
										</s:url>
										<td><s:a href="%{delete}"
												cssClass="btn btn-danger btn-xs">Delete</s:a></td>

							</tr>


						</s:iterator>


					</table>
				</div>
			</div>
		</div>
	</div>
</section>