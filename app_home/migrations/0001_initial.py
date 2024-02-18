# Generated by Django 4.2.10 on 2024-02-18 02:41

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='TagSiteModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('description', models.CharField(max_length=255)),
                ('slug', models.SlugField()),
            ],
        ),
        migrations.CreateModel(
            name='HomeSite',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('site_name', models.CharField(max_length=255)),
                ('site_description', models.CharField(max_length=500)),
                ('founder', models.CharField(max_length=100)),
                ('meta_description', models.TextField(max_length=255)),
                ('keyword', models.CharField(max_length=255)),
                ('date_created', models.DateField(auto_now_add=True)),
                ('is_published', models.BooleanField(default=True)),
                ('old_url', models.SlugField(blank=True, null=True)),
                ('slug', models.SlugField(blank=True, unique=True)),
                ('views', models.IntegerField(default=0)),
                ('tags', models.ManyToManyField(blank=True, to='app_home.tagsitemodel')),
            ],
        ),
    ]