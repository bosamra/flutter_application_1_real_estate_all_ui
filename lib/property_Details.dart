import 'package:flutter/material.dart';

/// Static preview colors (no external theme package).
abstract final class _PreviewTheme {
  static const Color background = Color(0xFFF6F7F8);
  static const Color primary = Color(0xFF2D6A4F);
  static const Color accent = Color(0xFF95D5B2);
  static const Color border = Color(0xFFE6E8EA);
  static const Color textPrimary = Color(0xFF1B2633);
  static const Color textSecondary = Color(0xFF6B7785);
}

/// Mock listing — UI only, no data layer.
const Map<String, dynamic> _mockListing = {
  'title': 'Luxury Apartment in Cairo, Maadi',
  'price': 'EGP 2,950,000',
  'category': 'apartment',
  'type': 'sale',
  'location': 'Maadi, Cairo',
  'latitude': 29.9602,
  'longitude': 31.2569,
  'beds': 5,
  'baths': 2,
  'area': 96,
  'description':
      'Bright corner unit with open kitchen, parquet floors, and a balcony '
      'overlooking greenery. Walking distance to cafés and the metro.',
};

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = _mockListing;
    final category = _formatLabel(data['category']);
    final listingType = _formatLabel(data['type']);

    return Scaffold(
      backgroundColor: _PreviewTheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _HeroImageBlock(),
            Transform.translate(
              offset: const Offset(0, -26),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(22, 22, 22, 34),
                decoration: const BoxDecoration(
                  color: _PreviewTheme.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  _InfoChip(
                                    icon: _categoryIcon(category),
                                    text: category,
                                  ),
                                  _InfoChip(
                                    icon: data['type'] == 'sale'
                                        ? Icons.sell_outlined
                                        : Icons.key_outlined,
                                    text: listingType,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Text(
                                data['title'] as String,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(
                                      color: _PreviewTheme.textPrimary,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 25,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${data['price']}',
                          style: const TextStyle(
                            color: _PreviewTheme.primary,
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _LocationBox(
                      location: data['location'] as String,
                      latitude: data['latitude'],
                      longitude: data['longitude'],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Property details',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: _PreviewTheme.textPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 14),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 2.55,
                      children: [
                        _SpecTile(
                          icon: Icons.bed_outlined,
                          label: 'Beds / Rooms',
                          value: '${data['beds']}',
                        ),
                        _SpecTile(
                          icon: Icons.bathtub_outlined,
                          label: 'Baths',
                          value: '${data['baths']}',
                        ),
                        _SpecTile(
                          icon: Icons.square_foot_outlined,
                          label: 'Area',
                          value: '${data['area']} m²',
                        ),
                        _SpecTile(
                          icon: Icons.home_work_outlined,
                          label: 'Type',
                          value: category,
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: _PreviewTheme.textPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: _PreviewTheme.border),
                      ),
                      child: Text(
                        data['description'] as String,
                        style: const TextStyle(
                          color: _PreviewTheme.textPrimary,
                          height: 1.55,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Decorative hero — no taps, no carousel controller.
class _HeroImageBlock extends StatelessWidget {
  const _HeroImageBlock();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _PreviewTheme.primary.withValues(alpha: 0.85),
                  _PreviewTheme.accent.withValues(alpha: 0.65),
                ],
              ),
            ),
          ),
          Center(
            child: Icon(
              Icons.apartment_rounded,
              size: 96,
              color: Colors.white.withValues(alpha: 0.35),
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.28),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.22),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 42,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (i) {
                final isActive = i == 1;
                return Container(
                  width: isActive ? 18 : 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(
                      alpha: isActive ? 0.95 : 0.45,
                    ),
                    borderRadius: BorderRadius.circular(99),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: _PreviewTheme.primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: _PreviewTheme.primary),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: _PreviewTheme.primary,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationBox extends StatelessWidget {
  final String location;
  final dynamic latitude;
  final dynamic longitude;

  const _LocationBox({
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    final hasCoordinates = latitude != null && longitude != null;

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _PreviewTheme.border),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _PreviewTheme.accent.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.location_on_outlined,
              color: _PreviewTheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                if (hasCoordinates) ...[
                  const SizedBox(height: 3),
                  Text(
                    '${latitude.toString()}, ${longitude.toString()}',
                    style: const TextStyle(
                      color: _PreviewTheme.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SpecTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _PreviewTheme.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: _PreviewTheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: _PreviewTheme.textSecondary,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: _PreviewTheme.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

IconData _categoryIcon(String category) {
  switch (category.toLowerCase()) {
    case 'villa':
      return Icons.villa_outlined;
    case 'chalet':
      return Icons.beach_access_outlined;
    case 'office':
      return Icons.business_center_outlined;
    default:
      return Icons.apartment_outlined;
  }
}

String _formatLabel(dynamic value) {
  final text = (value ?? '').toString().trim();
  if (text.isEmpty) {
    return 'Property';
  }
  return text[0].toUpperCase() + text.substring(1);
}
