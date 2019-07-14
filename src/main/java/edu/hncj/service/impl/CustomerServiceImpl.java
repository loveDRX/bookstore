package edu.hncj.service.impl;

import edu.hncj.entity.Customer;
import edu.hncj.mapper.CustomerMapper;
import edu.hncj.service.CustomerService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dayan
 * @since 2019-03-19
 */
@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer> implements CustomerService {

}
