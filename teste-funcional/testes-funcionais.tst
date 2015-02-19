<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head profile="http://selenium-ide.openqa.org/profiles/test-case">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="selenium.base" href="http://localhost:8080/" />
<title>CDU: Efetuar logout</title>
</head>
<body>
<table cellpadding="1" cellspacing="1" border="1">
<thead>
<tr><td rowspan="1" colspan="3">CDU: Efetuar logout</td></tr>
</thead><tbody>
<tr>
	<td>open</td>
	<td>/BibliotecaPessoal/faces/index.jsp</td>
	<td></td>
</tr>
<tr>
	<td>type</td>
	<td>id=form:login</td>
	<td>jonh</td>
</tr>
<tr>
	<td>type</td>
	<td>id=form:senha</td>
	<td>senha</td>
</tr>
<tr>
	<td>clickAndWait</td>
	<td>name=form:j_id_id27</td>
	<td></td>
</tr>
<tr>
	<td>assertText</td>
	<td>link=Efetuar Logout</td>
	<td>Efetuar Logout</td>
</tr>
<tr>
	<td>clickAndWait</td>
	<td>link=Efetuar Logout</td>
	<td></td>
</tr>
<tr>
	<td>assertText</td>
	<td>css=body</td>
	<td>Biblioteca Pessoal Faça o seu login para acessar o sistema, ou realize o seu cadastro gratuitamente. <br /> Login: <br /> Senha:</td>
</tr>

</tbody></table>
</body>
</html>
