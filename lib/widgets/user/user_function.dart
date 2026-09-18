import 'package:flutter/material.dart';

class UserFunction extends StatefulWidget {
  const UserFunction({super.key});

  @override
  State<UserFunction> createState() => _UserFunctionState();
}

class _UserFunctionState extends State<UserFunction> {
  // 数据驱动，加/减项只改这里
  final List<_FuncItem> _items = const [
    _FuncItem(Icons.chat_bubble_outline_rounded, "消息"),
    _FuncItem(Icons.star_border_rounded, "收藏"),
    _FuncItem(Icons.history_rounded, "历史"),
    _FuncItem(Icons.settings_outlined, "设置"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000), // 5% 黑，几乎看不见才高级
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          for (int i = 0; i < _items.length; i++) ...[
            Expanded(child: _buildItem(_items[i])),
            if (i != _items.length - 1) _buildDivider(),
          ],
        ],
      ),
    );
  }

  /// 单个功能项：图标 + 文字
  Widget _buildItem(_FuncItem item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // 让空白处也可点
      onTap: () {
        // TODO: 处理点击
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 图标底：极淡的灰，圆角方块
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(item.icon, size: 22, color: const Color(0xFF4A4A4A)),
          ),
          const SizedBox(height: 10),
          Text(
            item.label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF7A7A7A),
              height: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  /// 竖分隔线，1px、浅灰、不贯穿
  Widget _buildDivider() {
    return Container(width: 1, height: 30, color: const Color(0xFFF0F0F0));
  }
}

/// 功能项数据模型
class _FuncItem {
  final IconData icon;
  final String label;
  const _FuncItem(this.icon, this.label);
}
