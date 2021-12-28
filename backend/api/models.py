from django.db import models

class Member(models.Model):
    name = models.CharField(max_length=100)
    nickname = models.CharField(max_length=100)
    age = models.IntegerField()
    
    def __str__(self):
        return self.name
    
class Club(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name