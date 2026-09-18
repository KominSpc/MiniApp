import 'package:flutter/material.dart';

class UserDataInfo extends StatefulWidget {
  const UserDataInfo({super.key});

  @override
  State<UserDataInfo> createState() => _UserDataInfoState();
}

class _UserDataInfoState extends State<UserDataInfo> {
  final String userName = "张三";
  final String userSubtitle = "这个人很懒，什么都没写~";
  final String avatarUrl = "";
  final bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000), // 5% 黑
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                _buildAvatar(),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "张三",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F1F1F),
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        userSubtitle,
                        style: const TextStyle(
                          fontSize: 12.5,
                          color: Color(0xFF9A9A9A),
                          height: 1.3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // 细的 chevron，不要圆底 + 粗箭头
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFFC8C8C8),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/login");
      },
      child: SizedBox(
        width: 54,
        height: 54,
        child: Stack(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8EEFF), Color(0xFFF2E8FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: avatarUrl.isNotEmpty
                    ? Image.network(
                        avatarUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _defaultAvatar(),
                      )
                    : _defaultAvatar(),
              ),
            ),
            if (isOnline)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CD964),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _defaultAvatar() {
    return const Center(
      child: Icon(Icons.person_rounded, size: 30, color: Color(0xFF8FA3D9)),
    );
  }
}
