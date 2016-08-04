TRUNCATE `clients_data`; 
TRUNCATE `clouds_data`;
TRUNCATE`customers_data`;
TRUNCATE`customer_user_relations`;
TRUNCATE`job_queue`; 
TRUNCATE`job_queue_temp`;
TRUNCATE `purchase_log`;
TRUNCATE `servers_data`;
TRUNCATE `tickets`;
TRUNCATE `ticket_conversations`;
TRUNCATE `tunnels_data`;
TRUNCATE`voucher`;
TRUNCATE `tunnel_acl_relation`;
TRUNCATE `c_firewall`;
TRUNCATE `c_forwarding`;
TRUNCATE `c_qos`;
TRUNCATE `c_routing`;
TRUNCATE `destination`;
TRUNCATE `d_final`;
TRUNCATE `source`;
TRUNCATE `s_firewall`;
TRUNCATE `s_aliasing`;
TRUNCATE `s_qos`;
TRUNCATE `s_tos`;

UPDATE `client_subnets` SET `used_ips`=0, `client_id`=0, `last_updated`=0, `no_of_revision`=0;

UPDATE `server_subnets` SET `used_ips`=0, `server_id`=0, `last_updated`=0, `no_of_revision`=0;

UPDATE `real_ip_list` SET `in_use`=0, `server_id`=0, `last_updated`=0, `no_of_revision`=0;