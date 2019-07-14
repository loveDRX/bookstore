package edu.hncj.service.impl;

import edu.hncj.entity.OrderItem;
import edu.hncj.mapper.OrderItemMapper;
import edu.hncj.service.OrderItemService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author dayan
 * @since 2019-03-25
 */
@Service
public class OrderItemServiceImpl extends ServiceImpl<OrderItemMapper, OrderItem> implements OrderItemService {

}
