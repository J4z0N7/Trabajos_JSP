package controlador;

import Dao.ConectarDb;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelos.ClienteBean;
import modelos.PersonaBean;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
@Controller


public class clienteControlador{
    private PersonaValidation PersonaValidar;
    private JdbcTemplate jdbcTemplate;
    
    public clienteControlador (){
    this.PersonaValidar = new PersonaValidation();
    ConectarDb con = new ConectarDb();
    this.jdbcTemplate = new JdbcTemplate(con.conectarDB());
    }
    

@RequestMapping(value="formJstl.htm", method = RequestMethod.GET)
    public ModelAndView form(){
        PersonaBean persona = new PersonaBean();
        return new ModelAndView ("vista/formJstl", "persona", new PersonaBean());
   }

    
@RequestMapping(value="formJstl.htm", method = RequestMethod.POST)
    public ModelAndView form(
            @ModelAttribute("persona") PersonaBean pers,
            BindingResult result,
            SessionStatus status
    ){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("vista/mostrarDatos");
        mav.addObject("nombre", pers.getNombre());
        mav.addObject("apellido", pers.getApellido());
        mav.addObject("correo", pers.getCorreo());
        mav.addObject("telefono", pers.getEdad());
        return mav;  
    }     
@RequestMapping("listarJstl.htm")
public ModelAndView listarPersona(){
    String sql = "select * from clientes";
    ModelAndView mav = new ModelAndView();
    PersonaBean per = new PersonaBean();
    List datos = this.jdbcTemplate.queryForList(sql);
    mav.addObject("persona", datos);
    mav.setViewName("vista/listarJstl");
    return mav;
}    
@RequestMapping(value="agregarCliente.htm", method = RequestMethod.GET)
public ModelAndView agregarCliente(){
    
    ModelAndView mav = new ModelAndView();
    ClienteBean cli = new ClienteBean();
    mav.addObject("cliente", cli);
    mav.setViewName("vista/agregarCliente");
    return mav;
}
@RequestMapping(value="agregarCliente.htm", method = RequestMethod.POST)
public ModelAndView agregarCliente(ClienteBean cli){
    ModelAndView mav = new ModelAndView();
    String sql = "insert into clientes(nombre,direccion,telefono,ciudad) values(?,?,?,?)";
    jdbcTemplate.update(sql,
                cli.getNombre(),cli.getDireccion(), cli.getTelefono(),cli.getCiudad());
    mav.setViewName("redirect:/listarJstl.htm");
    return mav;
}
@RequestMapping("deleteCliente.htm")
public ModelAndView deleteCliente(HttpServletRequest req){
    ModelAndView mav = new ModelAndView();
    int id = Integer.parseInt(req.getParameter("id"));
    String sql = "delete * from clientes where id = ?";
    List datos = this.jdbcTemplate.queryForList(sql, id);
    
    mav.setViewName("vista/listarJstl");
    return mav;
}    
//Actualizar
@RequestMapping(value="updateCliente.htm" , method = RequestMethod.GET)
public ModelAndView updateCliente(HttpServletRequest req){
    ModelAndView mav = new ModelAndView();
    int id = Integer.parseInt(req.getParameter("id"));
    String sql = "select * from clientes where id = ?";
//    List cli = this.jdbcTemplate.queryForList(sql, id);
    ClienteBean cli = consultaClientexId(id);
    mav.addObject("cliente", cli);
    mav.setViewName("vista/updateCliente");
    return mav;
}

//Metodo Conversor
 public ClienteBean consultaClientexId(int id) {
        ClienteBean cliente = new ClienteBean();
        String sql = "select * from clientes where id = " + id;
        return (ClienteBean) this.jdbcTemplate.query(sql, new ResultSetExtractor<ClienteBean>() {
            public ClienteBean extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    cliente.setNombre(rs.getString("nombre"));
                    cliente.setDireccion(rs.getString("direccion"));
                    cliente.setTelefono(rs.getInt("telefono"));
                    cliente.setCiudad(rs.getString("ciudad"));
                }
                return cliente;                
            }

        });
    }

//Actualizar el cliente    

@RequestMapping(value="updateCliente.htm" , method = RequestMethod.POST)
public ModelAndView updateCliente(ClienteBean cli){
ModelAndView mav = new ModelAndView();
String sql = "update clientes set"
        +"nombre = ?,"
        +"direccion = ?,"
        +"telefono = ?,"
        +"ciudad = ?,"
        +"where id = ?";
jdbcTemplate.update(
        sql,cli.getNombre(),cli.getDireccion(),cli.getTelefono(),cli.getCiudad()
);
mav.setViewName("redirect://formCliente.htm");
return mav;
}

}