package ma.zs.generator.project.ws.rest.provided.facade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ma.zs.generator.helper.config.enumeration.CATEGORY;
import ma.zs.generator.project.bean.Technologie;
import ma.zs.generator.project.service.facade.TechnologieService;

/**
 * @author Qada
 *
 */
@RestController
@RequestMapping("generator/technologie")
public class TechnologieRest {

	@Autowired
	private TechnologieService technologieService;

	@PreAuthorize("isAuthenticated()")  	
	@GetMapping("/name/{name}")
	public Technologie findByName(@PathVariable String name) {
		return technologieService.findByName(name);
	}
	
	@PreAuthorize("isAuthenticated()")  	
	@PostMapping("/")
	public int save(@RequestBody Technologie technologie) {
		return technologieService.save(technologie);
	}

	@GetMapping("/category/{category}")
	public List<Technologie> findByCategory(@PathVariable CATEGORY category) {
		return technologieService.findByCategory(category);
	}

	@GetMapping("/")
	public List<Technologie> findAll() {
		return technologieService.findAll();
	}
	
	@PreAuthorize("isAuthenticated()")  	
    @DeleteMapping("/name/{name}")
	public int deleteByName(@PathVariable String name) {
		return technologieService.deleteByName(name);
	}
	
	
}
