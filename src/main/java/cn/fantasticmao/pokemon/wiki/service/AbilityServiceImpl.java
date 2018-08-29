package cn.fantasticmao.pokemon.wiki.service;

import cn.fantasticmao.pokemon.wiki.bean.AbilityBean;
import cn.fantasticmao.pokemon.wiki.domain.Ability;
import cn.fantasticmao.pokemon.wiki.domain.AbilityDetail;
import cn.fantasticmao.pokemon.wiki.repoistory.AbilityDetailRepository;
import cn.fantasticmao.pokemon.wiki.repoistory.AbilityRepository;
import com.mundo.core.util.CollectionUtil;
import com.mundo.core.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * AbilityServiceImpl
 *
 * @author maodh
 * @since 2018/8/29
 */
@Service
public class AbilityServiceImpl implements AbilityService {
    @Resource
    private AbilityRepository abilityRepository;
    @Resource
    private AbilityDetailRepository abilityDetailRepository;

    @Override
    public List<AbilityBean> listByNameZh(String nameZh) {
        if (StringUtil.isEmpty(nameZh)) {
            return Collections.emptyList();
        }

        List<Ability> abilityList = abilityRepository.findByNameZh(nameZh);
        if (CollectionUtil.isEmpty(abilityList)) {
            return Collections.emptyList();
        }

        List<Integer> abilityIdList = abilityList.stream().map(Ability::getId).collect(Collectors.toList());
        Map<Integer, AbilityDetail> abilityDetailMap = abilityDetailRepository.findByIdIn(abilityIdList).stream()
                .collect(Collectors.toMap(AbilityDetail::getId, Function.identity()));

        return abilityList.stream()
                .map(ability -> {
                    AbilityDetail abilityDetail = abilityDetailMap.get(ability.getId());
                    return AbilityBean.ofDomain(ability, abilityDetail);
                })
                .sorted()
                .collect(Collectors.toList());
    }
}
