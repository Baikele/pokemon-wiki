package cn.fantasticmao.pokemon.wiki.web;

import cn.fantasticmao.pokemon.wiki.domain.Pokemon;
import cn.fantasticmao.pokemon.wiki.service.PokemonService;
import com.mundo.core.util.StringUtil;
import com.mundo.web.annotation.JsonpController;
import com.mundo.web.support.JsonApi;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 宝可梦相关接口
 *
 * @author maodh
 * @since 2018/7/29
 */
@RestController
@JsonpController
@RequestMapping("/pokemon")
public class PokemonController {
    @Resource
    private PokemonService pokemonService;

    /**
     * @param nameZh 宝可梦的中文名称，支持模糊查询
     */
    @GetMapping(value = "/detail")
    public JsonApi listPokemonDetail(@RequestParam(defaultValue = "") String nameZh) {
        if (StringUtil.isEmpty(nameZh)) {
            return JsonApi.error(HttpStatus.BAD_REQUEST);
        }

        List<Pokemon> pokemonList = pokemonService.listByNameZh(nameZh);
        return JsonApi.success().data(pokemonList);
    }

    /**
     * @param generation 宝可梦的世代，默认 0 为全部
     */
    @GetMapping(value = "/list")
    public JsonApi listPokemon(@RequestParam(defaultValue = "0") Integer generation) {
        List<Pokemon> pokemonList = pokemonService.listByGeneration(generation);
        return JsonApi.success().data(pokemonList);
    }
}
