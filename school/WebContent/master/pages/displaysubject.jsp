<%@ taglib uri="/struts-tags" prefix="s" %>

<section class="two miniheaight">

	<div class="container-fluid">
		<header>
			<h2 class="stephedpa text-left">Subjects List</h2>
		</header>




		

		<div class="col-lg-2 col-md-12 col-sm-12 paddingnil">
			<div class="tile-body">
				<div class="table-condensed">

					<table class="table table-custom" id="editable-usage">

						<tr>

							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">Subjects</th>
							
							<th style="background: transparent url('common/images/table_header.gif') no-repeat scroll 0 0;">DisplaySubject</th>

						</tr>


						<s:iterator value="getsubjectlist" status="status">


							<tr>

								<td><s:property value="subjectname" /></td>
								<td><s:property value="displayname" /></td>

							</tr>


						</s:iterator>


					</table>
				</div>
			</div>
		</div>
	</div>
</section>